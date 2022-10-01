import 'package:flutter/material.dart';

import '../../helper/samoject_list_move_direction.dart';
import '../samoject_list_grid_state_manager.dart';
import 'samoject_list_grid_event.dart';

enum SamojectListGridScrollUpdateDirection {
  all,
  horizontal,
  vertical;

  bool get isAll => this == SamojectListGridScrollUpdateDirection.all;

  bool get isHorizontal =>
      isAll || this == SamojectListGridScrollUpdateDirection.horizontal;

  bool get isVertical =>
      isAll || this == SamojectListGridScrollUpdateDirection.vertical;
}

/// An event that occurs when dragging or moving after a long tap.
///
/// When the [offset] enters the area that needs to be scrolled,
/// the scroll animation continues until the end of the scroll direction.
///
/// When scrolling animation is in progress and entering an area that does not require scrolling,
/// the existing scroll animation is stopped.
///
/// If a point up event occurs while scroll animation is in progress,
/// the caller calling this event must call [SamojectListGridScrollUpdateEvent.stopScroll]
/// to stop the animation.
class SamojectListGridScrollUpdateEvent extends SamojectListGridEvent {
  final Offset offset;

  final SamojectListGridScrollUpdateDirection scrollDirection;

  SamojectListGridScrollUpdateEvent({
    required this.offset,
    this.scrollDirection = SamojectListGridScrollUpdateDirection.all,
  }) : super(
          type: SamojectListGridEventType.throttleLeading,
          duration: const Duration(milliseconds: 10),
        );

  late final Offset _directionalOffset;

  @override
  void handler(SamojectListGridStateManager stateManager) {
    bool scrolled = false;

    _directionalOffset = _getDirectionalOffset(stateManager);

    if (scrollDirection.isHorizontal) {
      scrolled |= _scrollHorizontal(stateManager);
    }

    if (scrollDirection.isVertical) {
      scrolled |= _scrollVertical(stateManager);
    }

    // If there is no controller being scrolled, the existing scroll event is aborted.
    if (!scrolled) {
      stopScroll(stateManager, scrollDirection);
    }
  }

  static void stopScroll(
    SamojectListGridStateManager stateManager,
    SamojectListGridScrollUpdateDirection scrollDirection,
  ) {
    if (scrollDirection.isHorizontal) {
      final ScrollController scroll = stateManager.scroll!.bodyRowsHorizontal!;

      scroll.jumpTo(scroll.offset);
    }

    if (scrollDirection.isVertical) {
      final ScrollController scroll = stateManager.scroll!.bodyRowsVertical!;

      scroll.jumpTo(scroll.offset);
    }
  }

  Offset _getDirectionalOffset(SamojectListGridStateManager stateManager) {
    return stateManager.toDirectionalOffset(offset) +
        stateManager.directionalScrollEdgeOffset;
  }

  bool _scrollHorizontal(SamojectListGridStateManager stateManager) {
    if (stateManager.needMovingScroll(
      _directionalOffset,
      SamojectListMoveDirection.left,
    )) {
      _scroll(stateManager, SamojectListMoveDirection.left);

      return true;
    } else if (stateManager.needMovingScroll(
      _directionalOffset,
      SamojectListMoveDirection.right,
    )) {
      _scroll(stateManager, SamojectListMoveDirection.right);

      return true;
    }

    return false;
  }

  bool _scrollVertical(SamojectListGridStateManager stateManager) {
    if (stateManager.needMovingScroll(
      _directionalOffset,
      SamojectListMoveDirection.up,
    )) {
      _scroll(stateManager, SamojectListMoveDirection.up);

      return true;
    } else if (stateManager.needMovingScroll(
      _directionalOffset,
      SamojectListMoveDirection.down,
    )) {
      _scroll(stateManager, SamojectListMoveDirection.down);

      return true;
    }

    return false;
  }

  void _scroll(SamojectListGridStateManager? stateManager,
      SamojectListMoveDirection move) {
    final ScrollController scroll = move.horizontal
        ? stateManager!.scroll!.bodyRowsHorizontal!
        : stateManager!.scroll!.bodyRowsVertical!;

    // If scrolling is in progress, the previous scroll animation continues.
    if (scroll.position.isScrollingNotifier.value) {
      return;
    }

    final double offsetToReachEndOfScroll =
        move.isLeft || move.isUp ? 0 : scroll.position.maxScrollExtent;

    final double remainingOffset =
        (offsetToReachEndOfScroll - scroll.offset).abs();

    final double offsetInSecond = stateManager.maxWidth! / 2;

    int msToReachEndOfScroll =
        (remainingOffset / offsetInSecond * 1000).toInt();

    if (msToReachEndOfScroll < 1) {
      msToReachEndOfScroll = 1;
    }

    final Duration duration = msToReachEndOfScroll.isFinite
        ? Duration(milliseconds: msToReachEndOfScroll)
        : Duration(seconds: remainingOffset ~/ offsetInSecond);

    scroll.animateTo(
      offsetToReachEndOfScroll,
      curve: Curves.linear,
      duration: duration,
    );
  }
}
