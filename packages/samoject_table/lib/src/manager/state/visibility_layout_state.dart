import '../../helper/samoject_table_size_helper.dart';
import '../../model/samoject_table_column.dart';
import '../../samoject_table_grid.dart';
import '../samoject_table_grid_state_manager.dart';

abstract class IVisibilityLayoutState {
  /// Set [SamojectTableColumn.startPosition] to [SamojectTableColumn.width].
  ///
  /// Set the horizontal position of the columns in the left area, center area, and right area
  /// according to the [SamojectTableColumn.frozen] value in [SamojectTableColumn.startPosition].
  ///
  /// This method should be called in an operation that dynamically changes the position of a column.
  /// Example) resizeColumn, frozenColumn, hideColumn...
  ///
  /// [notify] is called false in the normal case.
  /// When [notify] is called true,
  /// the notifyListeners of scrollController is forcibly called when build is not triggered.
  void updateVisibilityLayout({bool notify = false});
}

mixin VisibilityLayoutState implements ISamojectTableGridState {
  @override
  void updateVisibilityLayout({bool notify = false}) {
    if (refColumns.isEmpty) {
      return;
    }

    double leftX = 0;
    double bodyX = 0;
    double rightX = 0;

    SamojectTableAutoSize? autoSizeHelper;

    if (activatedColumnsAutoSize) {
      double offsetMaxWidth = maxWidth!;

      if (showFrozenColumn) {
        if (hasLeftFrozenColumns) {
          offsetMaxWidth -= SamojectTableGridSettings.gridBorderWidth;
        }

        if (hasRightFrozenColumns) {
          offsetMaxWidth -= SamojectTableGridSettings.gridBorderWidth;
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
          case SamojectTableColumnFrozen.none:
            column.startPosition = bodyX;
            bodyX += column.width;
            break;
          case SamojectTableColumnFrozen.start:
            column.startPosition = leftX;
            leftX += column.width;
            break;
          case SamojectTableColumnFrozen.end:
            column.startPosition = rightX;
            rightX += column.width;
            break;
        }
      } else {
        column.startPosition = bodyX;
        column.frozen = SamojectTableColumnFrozen.none;
        bodyX += column.width;
      }
    }

    updateScrollViewport();

    if (notify) {
      scroll?.horizontal?.notifyListeners();
    }
  }
}
