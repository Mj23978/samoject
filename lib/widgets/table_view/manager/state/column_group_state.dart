
import '../../helper/filtered_list.dart';
import '../../helper/table_column_group_helper.dart';
import '../../model/table_column.dart';
import '../../model/table_column_group.dart';
import '../table_grid_state_manager.dart';

abstract class IColumnGroupState {
  List<TableViewColumnGroup> get columnGroups;

  FilteredList<TableViewColumnGroup>? refColumnGroups;

  bool get hasColumnGroups;

  bool get showColumnGroups;

  void setShowColumnGroups(bool flag, {bool notify = true});

  List<TableColumnGroupPair> separateLinkedGroup({
    required List<TableViewColumnGroup> columnGroupList,
    required List<TableViewColumn> columns,
  });

  int columnGroupDepth(List<TableViewColumnGroup> groups);

  void removeColumnsInColumnGroup(
    List<TableViewColumn> columns, {
    bool notify = true,
  });
}

mixin ColumnGroupState implements ITableGridState {
  @override
  List<TableViewColumnGroup> get columnGroups => [...refColumnGroups!];

  @override
  FilteredList<TableViewColumnGroup>? get refColumnGroups => _refColumnGroups;

  @override
  set refColumnGroups(FilteredList<TableViewColumnGroup>? setColumnGroups) {
    if (setColumnGroups != null && setColumnGroups.isNotEmpty) {
      _showColumnGroups = true;
    }

    _refColumnGroups = setColumnGroups;

    _setGroupToColumn();
  }

  FilteredList<TableViewColumnGroup>? _refColumnGroups;

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
  List<TableColumnGroupPair> separateLinkedGroup({
    required List<TableViewColumnGroup> columnGroupList,
    required List<TableViewColumn> columns,
  }) {
    return TableColumnGroupHelper.separateLinkedGroup(
      columnGroupList: columnGroupList,
      columns: columns,
    );
  }

  @override
  int columnGroupDepth(List<TableViewColumnGroup> columnGroupList) {
    return TableColumnGroupHelper.maxDepth(
      columnGroupList: columnGroupList,
    );
  }

  @override
  void removeColumnsInColumnGroup(
    List<TableViewColumn> columns, {
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
    required TableViewColumnGroup columnGroup,
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
      column.group = TableColumnGroupHelper.getParentGroupIfExistsFromList(
        field: column.field,
        columnGroupList: refColumnGroups!,
      );
    }
  }
}
