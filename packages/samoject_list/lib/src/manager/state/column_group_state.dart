import '../../helper/filtered_list.dart';
import '../../helper/samoject_list_column_group_helper.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_column_group.dart';
import '../samoject_list_grid_state_manager.dart';

abstract class IColumnGroupState {
  List<SamojectListColumnGroup> get columnGroups;

  FilteredList<SamojectListColumnGroup>? refColumnGroups;

  bool get hasColumnGroups;

  bool get showColumnGroups;

  void setShowColumnGroups(bool flag, {bool notify = true});

  List<SamojectListColumnGroupPair> separateLinkedGroup({
    required List<SamojectListColumnGroup> columnGroupList,
    required List<SamojectListColumn> columns,
  });

  int columnGroupDepth(List<SamojectListColumnGroup> groups);

  void removeColumnsInColumnGroup(
    List<SamojectListColumn> columns, {
    bool notify = true,
  });
}

mixin ColumnGroupState implements ISamojectListGridState {
  @override
  List<SamojectListColumnGroup> get columnGroups => [...refColumnGroups!];

  @override
  FilteredList<SamojectListColumnGroup>? get refColumnGroups =>
      _refColumnGroups;

  @override
  set refColumnGroups(FilteredList<SamojectListColumnGroup>? setColumnGroups) {
    if (setColumnGroups != null && setColumnGroups.isNotEmpty) {
      _showColumnGroups = true;
    }

    _refColumnGroups = setColumnGroups;

    _setGroupToColumn();
  }

  FilteredList<SamojectListColumnGroup>? _refColumnGroups;

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
  List<SamojectListColumnGroupPair> separateLinkedGroup({
    required List<SamojectListColumnGroup> columnGroupList,
    required List<SamojectListColumn> columns,
  }) {
    return SamojectListColumnGroupHelper.separateLinkedGroup(
      columnGroupList: columnGroupList,
      columns: columns,
    );
  }

  @override
  int columnGroupDepth(List<SamojectListColumnGroup> columnGroupList) {
    return SamojectListColumnGroupHelper.maxDepth(
      columnGroupList: columnGroupList,
    );
  }

  @override
  void removeColumnsInColumnGroup(
    List<SamojectListColumn> columns, {
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
    required SamojectListColumnGroup columnGroup,
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
          SamojectListColumnGroupHelper.getParentGroupIfExistsFromList(
        field: column.field,
        columnGroupList: refColumnGroups!,
      );
    }
  }
}
