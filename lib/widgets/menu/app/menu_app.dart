import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header/header.dart';
import 'section/section.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {

  final ExpandableController _controller = ExpandableController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return expandableWrapper(context);
  }

  ExpandableNotifier expandableWrapper(BuildContext context) {
    return ExpandableNotifier(
      controller: _controller,
      child: ScrollOnExpand(
        scrollOnExpand: false,
        scrollOnCollapse: false,
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: false,
                tapBodyToCollapse: false,
                tapHeaderToExpand: false,
                iconPadding: EdgeInsets.zero,
                hasIcon: false,
              ),
              header: MenuAppHeader(),
              expanded: ViewSection(),
              collapsed: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MenuApp oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MenuAppSizes {
  static double iconSize = 16;
  static double headerHeight = 26;
  static double headerPadding = 6;
  static double iconPadding = 6;
  static double appVPadding = 14;
  static double scale = 1;
  static double get expandedPadding => iconSize * scale + headerPadding;
}
