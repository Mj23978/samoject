import 'package:dartz/dartz.dart' as dartz;
import 'package:flowy_infra/theme.dart';
import 'package:flowy_infra_ui/style_widget/hover.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flowy_infra_ui/widget/spacing.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:flutter/material.dart';
import 'package:flowy_infra/image.dart';

import '../../menu.dart';
import '../../../dialogs.dart';
import '../../view.dart';
import '../../view_ext.dart';
import 'disclosure_action.dart';

// ignore: must_be_immutable
class ViewSectionItem extends StatelessWidget {
  final bool isSelected;
  final ViewPB view;
  final void Function(ViewPB) onSelected;

  ViewSectionItem({
    Key? key,
    required this.view,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: ValueKey('$view.hashCode/$isSelected'));

  @override
  Widget build(BuildContext context) {
    return ViewDisclosureRegion(
      onTap: () => {},
      onSelected: (action) {
        // context
        //     .read<ViewBloc>()
        //     .add(const ViewEvent.setIsEditing(false));
        _handleAction(context, action);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          onTap: () => {},
          child: FlowyHover(
            style: HoverStyle(hoverColor: Colors.black26),
            builder: (_, onHover) => _render(
              context,
              onHover,
            ),
            setSelected: () => true,
          ),
        ),
      ),
    );
  }

  Widget _render(BuildContext context, bool onHover) {
    List<Widget> children = [
      SizedBox(width: 16, height: 16, child: Container()),
      const HSpace(2),
      Expanded(
          child: FlowyText.regular("state.view.name",
              fontSize: 12, overflow: TextOverflow.clip)),
    ];

    if (onHover) {
      children.add(
        ViewDisclosureButton(
          onTap: () => {},
          // context.read<ViewBloc>().add(const ViewEvent.setIsEditing(true)),
          onSelected: (action) {
            // context.read<ViewBloc>().add(const ViewEvent.setIsEditing(false));
            _handleAction(context, action);
          },
        ),
      );
    }

    return SizedBox(
      height: 26,
      child: Row(children: children).pLTRB(
          MenuAppSizes.expandedPadding, 0, MenuAppSizes.headerPadding, 0),
    );
  }

  void _handleAction(
      BuildContext context, dartz.Option<ViewDisclosureAction> action) {
    action.foldRight({}, (action, previous) {
      switch (action) {
        case ViewDisclosureAction.rename:
          TextFieldDialog(
            title: "LocaleKeys.disclosureAction_rename.tr()",
            value: "context.read<ViewBloc>().state.view.name",
            confirm: (newValue) {
              // context.read<ViewBloc>().add(ViewEvent.rename(newValue));
            },
          ).show(context);

          break;
        case ViewDisclosureAction.delete:
          // context.read<ViewBloc>().add(const ViewEvent.delete());
          break;
        case ViewDisclosureAction.duplicate:
          // context.read<ViewBloc>().add(const ViewEvent.duplicate());
          break;
      }
    });
  }
}

enum ViewDisclosureAction {
  rename,
  delete,
  duplicate,
}

extension ViewDisclosureExtension on ViewDisclosureAction {
  Widget get icon {
    switch (this) {
      case ViewDisclosureAction.rename:
        return svgWidget('editor/edit', color: const Color(0xff999999));
      case ViewDisclosureAction.delete:
        return svgWidget('editor/delete', color: const Color(0xff999999));
      case ViewDisclosureAction.duplicate:
        return svgWidget('editor/copy', color: const Color(0xff999999));
    }
  }
}
