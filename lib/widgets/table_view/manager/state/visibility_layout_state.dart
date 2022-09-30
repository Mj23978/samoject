
import '../../helper/table_size_helper.dart';
import '../../model/table_column.dart';
import '../../table_grid.dart';
import '../table_grid_state_manager.dart';

abstract class IVisibilityLayoutState {
  /// Set [TableViewColumn.startPosition] to [TableViewColumn.width].
  ///
  /// Set the horizontal position of the columns in the left area, center area, and right area
  /// according to the [TableViewColumn.frozen] value in [TableViewColumn.startPosition].
  ///
  /// This method should be called in an operation that dynamically changes the position of a column.
  /// Example) resizeColumn, frozenColumn, hideColumn...
  ///
  /// [notify] is called false in the normal case.
  /// When [notify] is called true,
  /// the notifyListeners of scrollController is forcibly called when build is not triggered.
  void updateVisibilityLayout({bool notify = false});
}

mixin VisibilityLayoutState implements ITableGridState {
  @override
  void updateVisibilityLayout({bool notify = false}) {
    if (refColumns.isEmpty) {
      return;
    }

    double leftX = 0;
    double bodyX = 0;
    double rightX = 0;

    TableAutoSize? autoSizeHelper;

    if (activatedColumnsAutoSize) {
      double offsetMaxWidth = maxWidth!;

      if (showFrozenColumn) {
        if (hasLeftFrozenColumns) {
          offsetMaxWidth -= TableGridSettings.gridBorderWidth;
        }

        if (hasRightFrozenColumns) {
          offsetMaxWidth -= TableGridSettings.gridBorderWidth;
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
          case TableColumnFrozen.none:
            column.startPosition = bodyX;
            bodyX += column.width;
            break;
          case TableColumnFrozen.start:
            column.startPosition = leftX;
            leftX += column.width;
            break;
          case TableColumnFrozen.end:
            column.startPosition = rightX;
            rightX += column.width;
            break;
        }
      } else {
        column.startPosition = bodyX;
        column.frozen = TableColumnFrozen.none;
        bodyX += column.width;
      }
    }

    updateScrollViewport();

    if (notify) {
      scroll?.horizontal?.notifyListeners();
    }
  }
}
