import 'package:expandable/expandable.dart';
import 'package:flowy_infra/icon_data.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:flowy_infra/image.dart';
import 'package:flutter_uix/flutter_uix.dart';

import '../../../dialogs.dart';
import '../menu_app.dart';
import 'add_button.dart';
import 'right_click_action.dart';

class MenuAppHeader extends StatelessWidget {
  const MenuAppHeader(
    {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MenuAppSizes.headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _renderExpandedIcon(context),
          // HSpace(MenuAppSizes.iconPadding),
          _renderTitle(context),
          _renderCreateViewButton(context),
        ],
      ),
    );
  }

  Widget _renderExpandedIcon(BuildContext context) {
    return SizedBox(
      width: MenuAppSizes.headerHeight,
      height: MenuAppSizes.headerHeight,
      child: InkWell(
        onTap: () {
          ExpandableController.of(context,
                  rebuildOnChange: false)
              ?.toggle();
        },
        child: ExpandableIcon(
          theme: ExpandableThemeData(
            expandIcon: FlowyIconData.drop_down_show,
            collapseIcon: FlowyIconData.drop_down_hide,
            iconColor: Colors.amberAccent,
            iconSize: MenuAppSizes.iconSize,
            iconPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            hasIcon: false,
          ),
        ),
      ),
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => ExpandableController.of(context,
                  rebuildOnChange: false, required: true)
              ?.toggle(),
          onSecondaryTap: () {
            final actionList = AppDisclosureActionSheet(
                onSelected: (action) => _handleAction(context, action));
            // actionList.show(
            //   context,
            //   anchorDirection: AnchorDirection.bottomWithCenterAligned,
            // );
          },
          child: const FlowyText.medium(
              "app.name",
              fontSize: 12,
              color: Colors.black,
            ),
      ),
    );
  }

  Widget _renderCreateViewButton(BuildContext context) {
    return Tooltip(
      message: "LocaleKeys.menuAppHeader_addPageTooltip.tr()",
      child: AddButton(
        onSelected: () {
          // context.read<AppBloc>().add(AppEvent.createView(
          //       LocaleKeys.menuAppHeader_defaultNewPageName.tr(),
          //       "",
          //       pluginBuilder.dataType,
          //       pluginBuilder.subDataType!,
          //       pluginBuilder.pluginType,
          //     ));
        },
      ).pSy(x: MenuAppSizes.headerPadding),
    );
  }

  void _handleAction(BuildContext context, Option<AppDisclosureAction> action) {
    action.fold(() {}, (action) {
      switch (action) {
        case AppDisclosureAction.rename:
          TextFieldDialog(
            title: "LocaleKeys.menuAppHeader_renameDialog.tr()",
            value: "",
            confirm: (newValue) {
              // context.read<AppBloc>().add(AppEvent.rename(newValue));
            },
          ).show(context);

          break;
        case AppDisclosureAction.delete:
          // context.read<AppBloc>().add(const AppEvent.delete());
          break;
      }
    });
  }
}

enum AppDisclosureAction {
  rename,
  delete,
}

extension AppDisclosureExtension on AppDisclosureAction {

  Widget get icon {
    switch (this) {
      case AppDisclosureAction.rename:
        return svgWidget('editor/edit', color: const Color(0xffe5e5e5));
      case AppDisclosureAction.delete:
        return svgWidget('editor/delete', color: const Color(0xffe5e5e5));
    }
  }
}
