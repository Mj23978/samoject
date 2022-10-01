import '../../helper/filtered_list.dart';
import '../../helper/samoject_table_column_group_helper.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_column_group.dart';
import '../samoject_table_grid_state_manager.dart';

abstract class IColumnGroupState {
  List<SamojectTableColumnGroup> get columnGroups;

  FilteredList<SamojectTableColumnGroup>? refColumnGroups;

  bool get hasColumnGroups;

  bool get showColumnGroups;

  void setShowColumnGroups(bool flag, {bool notify = true});

  List<SamojectTableColumnGroupPair> separateLinkedGroup({
    required List<SamojectTableColumnGroup> columnGroupList,
    required List<SamojectTableColumn> columns,
  });

  int columnGroupDepth(List<SamojectTableColumnGroup> groups);

  void removeColumnsInColumnGroup(
    List<SamojectTableColumn> columns, {
    bool notify = true,
  });
}

mixin ColumnGroupState implements ISamojectTableGridState {
  @override
  List<SamojectTableColumnGroup> get columnGroups => [...refColumnGroups!];

  @override
  FilteredList<SamojectTableColumnGroup>? get refColumnGroups =>
      _refColumnGroups;

  @override
  set refColumnGroups(FilteredList<SamojectTableColumnGroup>? setColumnGroups) {
    if (setColumnGroups != null && setColumnGroups.isNotEmpty) {
      _showColumnGroups = true;
    }

    _refColumnGroups = setColumnGroups;

    _setGroupToColumn();
  }

  FilteredList<SamojectTableColumnGroup>? _refColumnGroups;

  @override
  bool get hasColumnGroups =>
      refColumnGroups != null && refColumnGroups!.isNotEmpty;

  @override
  bool get showColumnGroups => _showColumnGroups == true && hasColumnGroups;

  bool? _showColumnGroups;

  @override
  void setShowColumnGroups(bool flag, {bool notify = true}) {
    if (_showColumnGroups == flag) {
      return;
    }

    _showColumnGroups = flag;

    if (notify) {
      notifyListeners();
    }
  }

  @override
  List<SamojectTableColumnGroupPair> separateLinkedGroup({
    required List<SamojectTableColumnGroup> columnGroupList,
    required List<SamojectTableColumn> columns,
  }) {
    return SamojectTableColumnGroupHelper.separateLinkedGroup(
      columnGroupList: columnGroupList,
      columns: columns,
    );
  }

  @override
  int columnGroupDepth(List<SamojectTableColumnGroup> columnGroupList) {
    return SamojectTableColumnGroupHelper.maxDepth(
      columnGroupList: columnGroupList,
    );
  }

  @override
  void removeColumnsInColumnGroup(
    List<SamojectTableColumn> columns, {
    bool notify = true,
  }) {
    if (refColumnGroups?.originalList.isEmpty == true) {
      return;
    }

    final Set<String> columnFields = Set.from(columns.map((e) => e.field));

    refColumnGroups!.removeWhereFromOriginal((group) {
      return _emptyGroupAfterRemoveColumns(
        columnGroup: group,
        columnFields: columnFields,
      );
    });

    if (notify) {
      notifyListeners();
    }
  }

  bool _emptyGroupAfterRemoveColumns({
    required SamojectTableColumnGroup columnGroup,
    required Set<String> columnFields,
  }) {
    if (columnGroup.hasFields) {
      columnGroup.fields!.removeWhere((field) => columnFields.contains(field));
    } else if (columnGroup.hasChildren) {
      columnGroup.children!.removeWhere((child) {
        return _emptyGroupAfterRemoveColumns(
          columnGroup: child,
          columnFields: columnFields,
        );
      });
    }

    return (columnGroup.hasFields && columnGroup.fields!.isEmpty) ||
        (columnGroup.hasChildren && columnGroup.children!.isEmpty);
  }

  void _setGroupToColumn() {
    if (hasColumnGroups == false) {
      return;
    }

    for (final column in refColumns) {
      column.group =
          SamojectTableColumnGroupHelper.getParentGroupIfExistsFromList(
        field: column.field,
        columnGroupList: refColumnGroups!,
      );
    }
  }
}
