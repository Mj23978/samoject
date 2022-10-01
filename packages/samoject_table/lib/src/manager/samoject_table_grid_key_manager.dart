import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../helper/samoject_table_clipboard_transformation.dart';
import '../helper/samoject_table_key_manager_event.dart';
import '../helper/samoject_table_move_direction.dart';
import '../samoject_table_grid.dart';
import 'samoject_table_grid_state_manager.dart';

class SamojectTableGridKeyEventResult {
  bool _skip = false;

  bool get isSkip => _skip;

  KeyEventResult skip(KeyEventResult result) {
    _skip = true;

    return result;
  }

  KeyEventResult consume(KeyEventResult result) {
    if (_skip) {
      _skip = false;

      return KeyEventResult.ignored;
    }

    return result;
  }
}

class SamojectTableGridKeyManager {
  SamojectTableGridStateManager stateManager;

  SamojectTableGridKeyEventResult eventResult =
      SamojectTableGridKeyEventResult();

  SamojectTableGridKeyManager({
    required this.stateManager,
  });

  final PublishSubject<SamojectTableKeyManagerEvent> _subject =
      PublishSubject<SamojectTableKeyManagerEvent>();

  PublishSubject<SamojectTableKeyManagerEvent> get subject => _subject;

  late final StreamSubscription _subscription;

  StreamSubscription get subscription => _subscription;

  void dispose() {
    _subscription.cancel();

    _subject.close();
  }

  void init() {
    final normalStream = _subject.stream.where((event) => !event.needsThrottle);

    final movingStream =
        _subject.stream.where((event) => event.needsThrottle).transform(
              ThrottleStreamTransformer(
                (_) => TimerStream(_, const Duration(milliseconds: 1)),
              ),
            );

    _subscription = MergeStream([normalStream, movingStream]).listen(_handler);
  }

  void _handler(SamojectTableKeyManagerEvent keyEvent) {
    stateManager.keyPressed.shift = keyEvent.isShiftPressed;
    stateManager.keyPressed.ctrl = keyEvent.isCtrlPressed;

    if (keyEvent.isKeyUpEvent) {
      return;
    }

    if (keyEvent.isMoving) {
      _handleMoving(keyEvent);
      return;
    }

    if (keyEvent.isEnter) {
      _handleEnter(keyEvent);
      return;
    }

    if (keyEvent.isTab) {
      _handleTab(keyEvent);
      return;
    }

    if (keyEvent.isHome || keyEvent.isEnd) {
      _handleHomeEnd(keyEvent);
      return;
    }

    if (keyEvent.isPageUp || keyEvent.isPageDown) {
      _handlePageUpDown(keyEvent);
      return;
    }

    if (keyEvent.isEsc) {
      _handleEsc(keyEvent);
      return;
    }

    if (keyEvent.isF2) {
      _handleF2(keyEvent);
      return;
    }

    if (keyEvent.isF3) {
      _handleF3(keyEvent);
      return;
    }

    if (keyEvent.isCharacter) {
      if (keyEvent.isCtrlC) {
        _handleCtrlC(keyEvent);
        return;
      }

      if (keyEvent.isCtrlV) {
        _handleCtrlV(keyEvent);
        return;
      }

      if (keyEvent.isCtrlA) {
        _handleCtrlA(keyEvent);
        return;
      }

      _handleCharacter(keyEvent);
    }
  }

  void _handleMoving(SamojectTableKeyManagerEvent keyEvent) {
    SamojectTableMoveDirection moveDirection;

    bool force = keyEvent.isHorizontal &&
        stateManager.configuration.enableMoveHorizontalInEditing == true;

    if (keyEvent.isLeft) {
      moveDirection = SamojectTableMoveDirection.left;
    } else if (keyEvent.isRight) {
      moveDirection = SamojectTableMoveDirection.right;
    } else if (keyEvent.isUp) {
      moveDirection = SamojectTableMoveDirection.up;
    } else if (keyEvent.isDown) {
      moveDirection = SamojectTableMoveDirection.down;
    } else {
      return;
    }

    if (keyEvent.event.isShiftPressed) {
      if (stateManager.isEditing == true) {
        return;
      }

      stateManager.moveSelectingCell(moveDirection);
      return;
    }

    if (stateManager.currentCell == null) {
      stateManager.setCurrentCell(stateManager.firstCell, 0);
      return;
    }

    stateManager.moveCurrentCell(moveDirection, force: force);
  }

  void _handleHomeEnd(SamojectTableKeyManagerEvent keyEvent) {
    if (keyEvent.isHome) {
      if (keyEvent.isCtrlPressed) {
        if (keyEvent.isShiftPressed) {
          stateManager
              .moveSelectingCellToEdgeOfRows(SamojectTableMoveDirection.up);
        } else {
          stateManager
              .moveCurrentCellToEdgeOfRows(SamojectTableMoveDirection.up);
        }
      } else {
        if (keyEvent.isShiftPressed) {
          stateManager.moveSelectingCellToEdgeOfColumns(
              SamojectTableMoveDirection.left);
        } else {
          stateManager
              .moveCurrentCellToEdgeOfColumns(SamojectTableMoveDirection.left);
        }
      }
    } else if (keyEvent.isEnd) {
      if (keyEvent.isCtrlPressed) {
        if (keyEvent.isShiftPressed) {
          stateManager
              .moveSelectingCellToEdgeOfRows(SamojectTableMoveDirection.down);
        } else {
          stateManager
              .moveCurrentCellToEdgeOfRows(SamojectTableMoveDirection.down);
        }
      } else {
        if (keyEvent.isShiftPressed) {
          stateManager.moveSelectingCellToEdgeOfColumns(
              SamojectTableMoveDirection.right);
        } else {
          stateManager
              .moveCurrentCellToEdgeOfColumns(SamojectTableMoveDirection.right);
        }
      }
    }
  }

  void _handlePageUpDown(SamojectTableKeyManagerEvent keyEvent) {
    final int moveCount =
        (stateManager.rowContainerHeight / stateManager.rowTotalHeight).floor();

    final direction = keyEvent.isPageUp
        ? SamojectTableMoveDirection.up
        : SamojectTableMoveDirection.down;

    if (keyEvent.isShiftPressed) {
      int rowIdx = stateManager.currentSelectingPosition?.rowIdx ??
          stateManager.currentCellPosition?.rowIdx ??
          0;

      rowIdx += keyEvent.isPageUp ? -moveCount : moveCount;

      stateManager.moveSelectingCellByRowIdx(rowIdx, direction);

      return;
    }

    if (keyEvent.isAltPressed && stateManager.isPaginated) {
      int toPage =
          keyEvent.isPageUp ? stateManager.page - 1 : stateManager.page + 1;

      if (toPage < 1) {
        toPage = 1;
      } else if (toPage > stateManager.totalPage) {
        toPage = stateManager.totalPage;
      }

      stateManager.setPage(toPage);

      return;
    }

    int rowIdx = stateManager.currentRowIdx!;

    rowIdx += keyEvent.isPageUp ? -moveCount : moveCount;

    stateManager.moveCurrentCellByRowIdx(rowIdx, direction);
  }

  void _handleEnter(SamojectTableKeyManagerEvent keyEvent) {
    // In SelectRow mode, the current Row is passed to the onSelected callback.
    if (stateManager.mode.isSelect) {
      stateManager.onSelected!(SamojectTableGridOnSelectedEvent(
        row: stateManager.currentRow,
        rowIdx: stateManager.currentRowIdx,
        cell: stateManager.currentCell,
      ));
      return;
    }

    if (stateManager.configuration.enterKeyAction.isNone) {
      return;
    }

    if (stateManager.configuration.enterKeyAction.isToggleEditing) {
      stateManager.toggleEditing(notify: false);
    } else {
      if (stateManager.isEditing == true ||
          stateManager.currentColumn?.enableEditingMode == false) {
        final saveIsEditing = stateManager.isEditing;

        _moveCell(keyEvent);

        stateManager.setEditing(saveIsEditing, notify: false);
      } else {
        stateManager.toggleEditing(notify: false);
      }
    }

    if (stateManager.autoEditing) {
      stateManager.setEditing(true, notify: false);
    }

    stateManager.notifyListeners();
  }

  void _handleTab(SamojectTableKeyManagerEvent keyEvent) {
    if (stateManager.currentCell == null) {
      stateManager.setCurrentCell(stateManager.firstCell, 0);
      return;
    }

    final saveIsEditing = stateManager.isEditing;

    if (keyEvent.event.isShiftPressed) {
      stateManager.moveCurrentCell(SamojectTableMoveDirection.left,
          force: true);
    } else {
      stateManager.moveCurrentCell(SamojectTableMoveDirection.right,
          force: true);
    }

    stateManager.setEditing(stateManager.autoEditing || saveIsEditing);
  }

  void _handleEsc(SamojectTableKeyManagerEvent keyEvent) {
    if (stateManager.mode.isSelect ||
        (stateManager.mode.isPopup && !stateManager.isEditing)) {
      stateManager.onSelected!(SamojectTableGridOnSelectedEvent(
        row: null,
        rowIdx: null,
        cell: null,
      ));
      return;
    }

    if (stateManager.isEditing) {
      stateManager.setEditing(false);
    }
  }

  void _handleF2(SamojectTableKeyManagerEvent keyEvent) {
    if (!stateManager.isEditing) {
      stateManager.setEditing(true);
    }
  }

  void _handleF3(SamojectTableKeyManagerEvent keyEvent) {
    final currentColumn = stateManager.currentColumn;

    if (currentColumn == null) {
      return;
    }

    if (!stateManager.showColumnFilter) {
      return;
    }

    if (currentColumn.filterFocusNode?.canRequestFocus == true) {
      currentColumn.filterFocusNode?.requestFocus();
      stateManager.setKeepFocus(false);

      return;
    }

    stateManager.showFilterPopup(
      keyEvent.focusNode.context!,
      calledColumn: stateManager.currentColumn,
    );
  }

  void _handleCtrlC(SamojectTableKeyManagerEvent keyEvent) {
    if (stateManager.isEditing == true) {
      return;
    }

    Clipboard.setData(ClipboardData(text: stateManager.currentSelectingText));
  }

  void _handleCtrlV(SamojectTableKeyManagerEvent keyEvent) {
    if (stateManager.currentCell == null) {
      return;
    }

    if (stateManager.isEditing == true) {
      return;
    }

    Clipboard.getData('text/plain').then((value) {
      List<List<String>> textList =
          SamojectTableClipboardTransformation.stringToList(value!.text!);

      stateManager.pasteCellValue(textList);
    });
  }

  void _handleCtrlA(SamojectTableKeyManagerEvent keyEvent) {
    if (stateManager.isEditing == true) {
      return;
    }

    stateManager.setAllCurrentSelecting();
  }

  void _handleCharacter(SamojectTableKeyManagerEvent keyEvent) {
    if (stateManager.isEditing != true && stateManager.currentCell != null) {
      stateManager.setEditing(true);

      if (keyEvent.event.character == null) {
        return;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (stateManager.textEditingController != null) {
          stateManager.textEditingController!.text = keyEvent.event.character!;
        }
      });
    }
  }

  void _moveCell(SamojectTableKeyManagerEvent keyEvent) {
    final enterKeyAction = stateManager.configuration.enterKeyAction;

    if (enterKeyAction.isNone) {
      return;
    }

    if (enterKeyAction.isEditingAndMoveDown) {
      if (keyEvent.event.isShiftPressed) {
        stateManager.moveCurrentCell(
          SamojectTableMoveDirection.up,
          notify: false,
        );
      } else {
        stateManager.moveCurrentCell(
          SamojectTableMoveDirection.down,
          notify: false,
        );
      }
    } else if (enterKeyAction.isEditingAndMoveRight) {
      if (keyEvent.event.isShiftPressed) {
        stateManager.moveCurrentCell(
          SamojectTableMoveDirection.left,
          force: true,
          notify: false,
        );
      } else {
        stateManager.moveCurrentCell(
          SamojectTableMoveDirection.right,
          force: true,
          notify: false,
        );
      }
    }
  }
}
