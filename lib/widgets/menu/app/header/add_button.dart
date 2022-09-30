import 'package:flowy_infra/image.dart';
import 'package:flowy_infra_ui/flowy_infra_ui.dart';
import 'package:flowy_infra_ui/style_widget/hover.dart';
import 'package:flowy_infra_ui/style_widget/icon_button.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_uix/flutter_uix.dart';

class AddButton extends ConsumerWidget {
  final Function() onSelected;
  const AddButton({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return FlowyIconButton(
      hoverColor: Colors.black26,
      width: 22,
      onPressed: () {
        ActionList(
          anchorContext: context,
          onSelected: onSelected,
        ).show(context);
      },
      icon: svgWidget("home/add", color: Colors.amber)
          .pSy(x: 3, y: 3),
    );
  }
}

class ActionList {
  final Function() onSelected;
  final BuildContext anchorContext;
  final String _identifier = 'DisclosureButtonActionList';

  const ActionList({required this.anchorContext, required this.onSelected});

  void show(BuildContext buildContext) {
    final items = ["1", "2"].map(
      (pluginBuilder) {
        return CreateItem(
          onSelected: () {
            onSelected();
            FlowyOverlay.of(buildContext).remove(_identifier);
          },
        );
      },
    ).toList();

    ListOverlay.showWithAnchor(
      buildContext,
      identifier: _identifier,
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
      anchorContext: anchorContext,
      anchorDirection: AnchorDirection.bottomRight,
      width: 120,
      height: 80,
    );
  }
}

class CreateItem extends StatelessWidget {
  final Function() onSelected;
  const CreateItem({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = HoverStyle(hoverColor: Colors.black12);

    return FlowyHover(
      style: config,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onSelected(),
        child: const FlowyText.medium(
          "pluginBuilder.menuName",
          color: Colors.red,
          fontSize: 12,
        ).pSy(x: 10, y: 6),
      ),
    );
  }
}
