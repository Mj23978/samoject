
import '../../helper/table_size_helper.dart';
import '../../model/table_column.dart';
import '../../table_grid.dart';
import '../../table_grid_configuration.dart';
import '../table_grid_state_manager.dart';

/// Automatically adjust column width or manage width adjustment mode.
abstract class IColumnSizingState {
  /// Refers to the value set in [TableGridConfiguration].
  TableGridColumnSizeConfig get columnSizeConfig;

  /// Automatically adjust the column width at the start of the grid
  /// or when the grid width is changed.
  TableAutoSizeMode get columnsAutoSizeMode;

  /// Condition for changing column width.
  TableResizeMode get columnsResizeMode;

  /// Whether [columnsAutoSizeMode] is enabled.
  bool get enableColumnsAutoSize;

  /// Whether [columnsAutoSizeMode] should be applied while [columnsAutoSizeMode] is enabled.
  ///
  /// After changing the state of the column,
  /// set whether to apply [columnsAutoSizeMode] again according to the value below.
  /// [TableGridColumnSizeConfig.restoreAutoSizeAfterHideColumn]
  /// [TableGridColumnSizeConfig.restoreAutoSizeAfterFrozenColumn]
  /// [TableGridColumnSizeConfig.restoreAutoSizeAfterMoveColumn]
  /// [TableGridColumnSizeConfig.restoreAutoSizeAfterInsertColumn]
  /// [TableGridColumnSizeConfig.restoreAutoSizeAfterRemoveColumn]
  ///
  /// If the above values are set to false,
  /// [columnsAutoSizeMode] is not applied after changing the column state.
  ///
  /// In this case, if the width of the grid is changed again or there is a layout change,
  /// it will be activated again.
  bool get activatedColumnsAutoSize;

  void activateColumnsAutoSize();

  void deactivateColumnsAutoSize();

  TableAutoSize getColumnsAutoSizeHelper({
    required Iterable<TableViewColumn> columns,
    required double maxWidth,
  });

  TableResize getColumnsResizeHelper({
    required List<TableViewColumn> columns,
    required TableViewColumn column,
    required double offset,
  });

  void setColumnSizeConfig(TableGridColumnSizeConfig config);
}

mixin ColumnSizingState implements ITableGridState {
  @override
  TableGridColumnSizeConfig get columnSizeConfig => configuration.columnSize;

  @override
  TableAutoSizeMode get columnsAutoSizeMode => columnSizeConfig.autoSizeMode;

  @override
  TableResizeMode get columnsResizeMode => columnSizeConfig.resizeMode;

  @override
  bool get enableColumnsAutoSize => !columnsAutoSizeMode.isNone;

  @override
  bool get activatedColumnsAutoSize =>
      enableColumnsAutoSize && _activatedColumnsAutoSize != false;

  bool? _activatedColumnsAutoSize;

  @override
  void activateColumnsAutoSize() {
    _activatedColumnsAutoSize = true;
  }

  @override
  void deactivateColumnsAutoSize() {
    _activatedColumnsAutoSize = false;
  }

  @override
  TableAutoSize getColumnsAutoSizeHelper({
    required Iterable<TableViewColumn> columns,
    required double maxWidth,
  }) {
    assert(columnsAutoSizeMode.isNone == false);
    assert(columns.isNotEmpty);

    double? scale;

    if (columnsAutoSizeMode.isScale) {
      final totalWidth = columns.fold<double>(0, (pre, e) => pre += e.width);

      scale = maxWidth / totalWidth;
    }

    return TableAutoSizeHelper.items(
      maxSize: maxWidth,
      length: columns.length,
      itemMinSize: TableGridSettings.minColumnWidth,
      mode: columnsAutoSizeMode,
      scale: scale,
    );
  }

  @override
  TableResize getColumnsResizeHelper({
    required List<TableViewColumn> columns,
    required TableViewColumn column,
    required double offset,
  }) {
    assert(!columnsResizeMode.isNone && !columnsResizeMode.isNormal);
    assert(columns.isNotEmpty);

    return TableResizeHelper.items<TableViewColumn>(
      offset: offset,
      items: columns,
      isMainItem: (e) => e.key == column.key,
      getItemSize: (e) => e.width,
      getItemMinSize: (e) => e.minWidth,
      setItemSize: (e, size) => e.width = size,
      mode: columnsResizeMode,
    );
  }

  @override
  void setColumnSizeConfig(TableGridColumnSizeConfig config) {
    setConfiguration(
      configuration.copyWith(columnSize: config),
      updateLocale: false,
      applyColumnFilter: false,
    );

    if (enableColumnsAutoSize) {
      activateColumnsAutoSize();

      notifyResizingListeners();
    }
  }
}
