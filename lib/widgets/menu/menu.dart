export './app/header/header.dart';
export './app/menu_app.dart';

import 'dart:io' show Platform;
import 'package:flowy_infra/notifier.dart';
import 'package:flowy_infra/size.dart';
import 'package:flowy_infra/theme.dart';
import 'package:flowy_infra_ui/style_widget/scrolling/styled_list.dart';
import 'package:flowy_infra_ui/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flowy_infra/time/duration.dart';
import 'package:flowy_infra/image.dart';
import 'package:flowy_infra_ui/style_widget/icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:notion/widgets/menu/app/section/item.dart';
import 'package:notion/widgets/menu/view.dart';
import 'app/menu_app.dart';
import 'app/create_button.dart';
import 'menu_user.dart';

class HomeMenu extends StatelessWidget {

  const HomeMenu({
    Key? key,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _renderBody(context);
  }

  Widget _renderBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MenuTopBar(),
                const VSpace(10),
                _renderApps(context),
              ],
            ).pSy(x: Insets.l),
          ),
          const VSpace(20),
          // const MenuTrash().padding(horizontal: Insets.l),
          const VSpace(20),
          _renderNewAppButton(context),
        ],
      ),
    );
  }

  Widget _renderApps(BuildContext context) {
    final views =[ViewPB("1"), ViewPB("2")];
    final menuItems = <Widget>[
      ViewSectionItem(view: views[0], isSelected: false, onSelected: (v) => {}),
      ViewSectionItem(view: views[1], isSelected: false, onSelected: (v) => {}),
    ];
    return ExpandableTheme(
      data: ExpandableThemeData(
          useInkWell: true, animationDuration: Durations.medium),
      child: Expanded(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: ReorderableListView.builder(
            itemCount: menuItems.length,
            buildDefaultDragHandles: false,
            header: Padding(
              padding: EdgeInsets.only(bottom: 20.0 - MenuAppSizes.appVPadding),
              child: MenuUser(),
            ),
            onReorder: (oldIndex, newIndex) {
              // Moving item1 from index 0 to index 1
              //  expect:   oldIndex: 0, newIndex: 1
              //  receive:  oldIndex: 0, newIndex: 2
              //  Workaround: if newIndex > oldIndex, we just minus one
              int index = newIndex > oldIndex ? newIndex - 1 : newIndex;
              // context
              //     .read<MenuBloc>()
              //     .add(MenuEvent.moveApp(oldIndex, index));
            },
            physics: StyledScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ReorderableDragStartListener(
                key: ValueKey(views[index].id),
                index: index,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MenuAppSizes.appVPadding / 2),
                  child: menuItems[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _renderNewAppButton(BuildContext context) {
    return NewAppButton(press: (appName) => {}
        // context.read<MenuBloc>().add(MenuEvent.createApp(appName, desc: "")),
        );
  }
}

class MenuSharedState {
  final ValueNotifier<ViewPB?> _latestOpenView = ValueNotifier<ViewPB?>(null);

  MenuSharedState({ViewPB? view}) {
    _latestOpenView.value = view;
  }

  ViewPB? get latestOpenView => _latestOpenView.value;

  set latestOpenView(ViewPB? view) {
    if (_latestOpenView.value != view) {
      _latestOpenView.value = view;
    }
  }

  VoidCallback addLatestViewListener(void Function(ViewPB?) callback) {
    listener() {
      callback(_latestOpenView.value);
    }

    _latestOpenView.addListener(listener);
    return listener;
  }

  void removeLatestViewListener(VoidCallback listener) {
    _latestOpenView.removeListener(listener);
  }
}

class MenuTopBar extends StatelessWidget {
  const MenuTopBar({Key? key}) : super(key: key);

  Widget renderIcon(BuildContext context) {
    if (Platform.isMacOS) {
      return Container();
    }
    // final theme = context.watch<AppTheme>();
    return svgWithSize("flowy_logo_with_text", const Size(92, 17));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          renderIcon(context),
          const Spacer(),
          Tooltip(
              richMessage: TextSpan(children: [
                TextSpan(text: "LocaleKeys.sideBar_closeSidebar.tr()" + "\n"),
                TextSpan(
                  text: Platform.isMacOS ? "⌘+\\" : "Ctrl+\\",
                  style: const TextStyle(color: Colors.white60),
                ),
              ]),
              child: FlowyIconButton(
                width: 28,
                onPressed: () => {},
                iconPadding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                icon: svgWidget("home/hide_menu", color: Colors.red),
              ))
        ],
      ),
    );
  }
}
