import '../../helper/samoject_list_size_helper.dart';
import '../../model/samoject_list_column.dart';
import '../../samoject_list_grid.dart';
import '../samoject_list_grid_state_manager.dart';

abstract class IVisibilityLayoutState {
  /// Set [SamojectListColumn.startPosition] to [SamojectListColumn.width].
  ///
  /// Set the horizontal position of the columns in the left area, center area, and right area
  /// according to the [SamojectListColumn.frozen] value in [SamojectListColumn.startPosition].
  ///
  /// This method should be called in an operation that dynamically changes the position of a column.
  /// Example) resizeColumn, frozenColumn, hideColumn...
  ///
  /// [notify] is called false in the normal case.
  /// When [notify] is called true,
  /// the notifyListeners of scrollController is forcibly called when build is not triggered.
  void updateVisibilityLayout({bool notify = false});
}

mixin VisibilityLayoutState implements ISamojectListGridState {
  @override
  void updateVisibilityLayout({bool notify = false}) {
    if (refColumns.isEmpty) {
      return;
    }

    double leftX = 0;
    double bodyX = 0;
    double rightX = 0;

    SamojectListAutoSize? autoSizeHelper;

    if (activatedColumnsAutoSize) {
      double offsetMaxWidth = maxWidth!;

      if (showFrozenColumn) {
        if (hasLeftFrozenColumns) {
          offsetMaxWidth -= SamojectListGridSettings.gridBorderWidth;
        }

        if (hasRightFrozenColumns) {
          offsetMaxWidth -= SamojectListGridSettings.gridBorderWidth;
        }
      }

      autoSizeHelper = getColumnsAutoSizeHelper(
        columns: refColumns,
        maxWidth: offsetMaxWidth,
      );
    }

    for (final column in refColumns) {
      if (autoSizeHelper != null) {
        column.width = autoSizeHelper.getItemSize(column.width);
      }

      if (showFrozenColumn) {
        switch (column.frozen) {
          case SamojectListColumnFrozen.none:
            column.startPosition = bodyX;
            bodyX += column.width;
            break;
          case SamojectListColumnFrozen.start:
            column.startPosition = leftX;
            leftX += column.width;
            break;
          case SamojectListColumnFrozen.end:
            column.startPosition = rightX;
            rightX += column.width;
            break;
        }
      } else {
        column.startPosition = bodyX;
        column.frozen = SamojectListColumnFrozen.none;
        bodyX += column.width;
      }
    }

    updateScrollViewport();

    if (notify) {
      scroll?.horizontal?.notifyListeners();
    }
  }
}
