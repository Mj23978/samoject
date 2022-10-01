import '../../helper/samoject_list_size_helper.dart';
import '../../model/samoject_list_column.dart';
import '../../samoject_list_grid.dart';
import '../../samoject_list_grid_configuration.dart';
import '../samoject_list_grid_state_manager.dart';

/// Automatically adjust column width or manage width adjustment mode.
abstract class IColumnSizingState {
  /// Refers to the value set in [SamojectListGridConfiguration].
  SamojectListGridColumnSizeConfig get columnSizeConfig;

  /// Automatically adjust the column width at the start of the grid
  /// or when the grid width is changed.
  SamojectListAutoSizeMode get columnsAutoSizeMode;

  /// Condition for changing column width.
  SamojectListResizeMode get columnsResizeMode;

  /// Whether [columnsAutoSizeMode] is enabled.
  bool get enableColumnsAutoSize;

  /// Whether [columnsAutoSizeMode] should be applied while [columnsAutoSizeMode] is enabled.
  ///
  /// After changing the state of the column,
  /// set whether to apply [columnsAutoSizeMode] again according to the value below.
  /// [SamojectListGridColumnSizeConfig.restoreAutoSizeAfterHideColumn]
  /// [SamojectListGridColumnSizeConfig.restoreAutoSizeAfterFrozenColumn]
  /// [SamojectListGridColumnSizeConfig.restoreAutoSizeAfterMoveColumn]
  /// [SamojectListGridColumnSizeConfig.restoreAutoSizeAfterInsertColumn]
  /// [SamojectListGridColumnSizeConfig.restoreAutoSizeAfterRemoveColumn]
  ///
  /// If the above values are set to false,
  /// [columnsAutoSizeMode] is not applied after changing the column state.
  ///
  /// In this case, if the width of the grid is changed again or there is a layout change,
  /// it will be activated again.
  bool get activatedColumnsAutoSize;

  void activateColumnsAutoSize();

  void deactivateColumnsAutoSize();

  SamojectListAutoSize getColumnsAutoSizeHelper({
    required Iterable<SamojectListColumn> columns,
    required double maxWidth,
  });

  SamojectListResize getColumnsResizeHelper({
    required List<SamojectListColumn> columns,
    required SamojectListColumn column,
    required double offset,
  });

  void setColumnSizeConfig(SamojectListGridColumnSizeConfig config);
}

mixin ColumnSizingState implements ISamojectListGridState {
  @override
  SamojectListGridColumnSizeConfig get columnSizeConfig =>
      configuration.columnSize;

  @override
  SamojectListAutoSizeMode get columnsAutoSizeMode =>
      columnSizeConfig.autoSizeMode;

  @override
  SamojectListResizeMode get columnsResizeMode => columnSizeConfig.resizeMode;

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
  SamojectListAutoSize getColumnsAutoSizeHelper({
    required Iterable<SamojectListColumn> columns,
    required double maxWidth,
  }) {
    assert(columnsAutoSizeMode.isNone == false);
    assert(columns.isNotEmpty);

    double? scale;

    if (columnsAutoSizeMode.isScale) {
      final totalWidth = columns.fold<double>(0, (pre, e) => pre += e.width);

      scale = maxWidth / totalWidth;
    }

    return SamojectListAutoSizeHelper.items(
      maxSize: maxWidth,
      length: columns.length,
      itemMinSize: SamojectListGridSettings.minColumnWidth,
      mode: columnsAutoSizeMode,
      scale: scale,
    );
  }

  @override
  SamojectListResize getColumnsResizeHelper({
    required List<SamojectListColumn> columns,
    required SamojectListColumn column,
    required double offset,
  }) {
    assert(!columnsResizeMode.isNone && !columnsResizeMode.isNormal);
    assert(columns.isNotEmpty);

    return SamojectListResizeHelper.items<SamojectListColumn>(
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
  void setColumnSizeConfig(SamojectListGridColumnSizeConfig config) {
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
