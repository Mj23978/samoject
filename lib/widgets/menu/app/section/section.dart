import 'package:flutter/material.dart';
import 'package:notion/widgets/menu/view.dart';
import 'package:reorderables/reorderables.dart';

import 'item.dart';

class ViewSection extends StatelessWidget {
  const ViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _reorderableColum(context);
  }

  ReorderableColumn _reorderableColum(BuildContext context) {
    final children = ["1", "2"].map((view) {
      return ViewSectionItem(
        key: ValueKey(view),
        view: ViewPB(view),
        isSelected: _isViewSelected(view),
        onSelected: (view) => {},
      );
    }).toList();

    return ReorderableColumn(
      needsLongPressDraggable: false,
      onReorder: (oldIndex, index) {
        // context.read<ViewSectionBloc>().add(ViewSectionEvent.moveView(oldIndex, index));
      },
      children: children,
    );
  }

  bool _isViewSelected(String viewId) {
    return false;
  }
}
