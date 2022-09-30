import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_uix/flutter_uix.dart';
import '../../utils/extensions.dart';
import '../../widgets/menu/menu.dart';
import '../../widgets/sidebar/expandable_cell.dart';
import '../../widgets/sidebar/sidebar.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

  final _controller = SidebarController(selectedIndex: 0);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            controller: _controller,
            theme: SidebarTheme(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              hoverColor: const Color(0xFF384047),
              textStyle: const TextStyle(fontSize: 12, color: Colors.white),
              selectedTextStyle:
                  const TextStyle(fontSize: 12, color: Color(0xFF0AB4FF)),
              itemTextPadding: const EdgeInsets.only(left: 20),
              selectedItemTextPadding: const EdgeInsets.only(left: 20),
              itemDecoration: const BoxDecoration(
                  // border: Border.all(color: canvasColor),
                  ),
              selectedItemDecoration: BoxDecoration(
                border: const Border(
                    left: BorderSide(
                  color: Color(0xFF0AB4FF),
                  width: 3,
                )),
                color: const Color(0xFF28404C),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: const IconThemeData(
                color: Color(0xFF757C86),
                size: 20,
              ),
            ),
            extendedTheme: SidebarTheme(
              width: 200,
              decoration: BoxDecoration(
                color: canvasColor,
              ),
              margin: const EdgeInsets.only(right: 1),
              selectedIconTheme: const IconThemeData(
                color: Color(0xFF0AB4FF),
                size: 20,
              ),
              itemMargin: const EdgeInsets.only(top: 0),
              selectedItemMargin: const EdgeInsets.only(top: 0),
              selectedItemPadding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 2),
              padding: const EdgeInsets.only(right: 9),
              itemPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 1),
            ),
            footerDivider: divider,
            headerBuilder: (context, extended) {
              return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/memoji/1.png'),
                ),
              );
            },
            items: [
              (theme, ac, ex, se) => ExpandableCell(
                    items: [],
                    icon: Icons.home,
                    animationController: ac,
                    theme: theme,
                    extended: ex,
                    selected: se,
                    label: 'Home',
                    onTap: () {
                      _controller.selectIndex(0);
                      debugPrint('Hello');
                    },
                  ),
              (theme, ac, ex, se) => ExpandableCell(
                    animationController: ac,
                    items: [],
                    theme: theme,
                    icon: Icons.search,
                    extended: ex,
                    selected: se,
                    label: 'Search',
                    onTap: () {
                      _controller.selectIndex(1);
                      debugPrint('Hello');
                    },
                  ),
              (theme, ac, ex, se) => ExpandableCell(
                    items: [],
                    animationController: ac,
                    theme: theme,
                    extended: ex,
                    selected: se,
                    icon: Icons.people,
                    label: 'People',
                    onTap: () {
                      _controller.selectIndex(2);
                      debugPrint('Hello');
                    },
                  ),
              (theme, ac, ex, se) => ExpandableCell(
                    items: [],
                    animationController: ac,
                    theme: theme,
                    extended: ex,
                    selected: se,
                    icon: Icons.favorite,
                    label: 'Favorite',
                    onTap: () {
                      _controller.selectIndex(3);
                      debugPrint('Hello');
                    },
                  ),
            ],
          ),
          Expanded(
            child: Center(
              child: _ScreensExample(controller: _controller),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          case 1:
            return ExpandableTheme(
              data: const ExpandableThemeData(
                iconColor: Colors.blue,
                useInkWell: true,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[],
              ),
            );
          case 2:
            return Text(
              'Favorites',
              style: theme.textTheme.headline5,
            );
          case 3:
            return Text(
              'Favorites',
              style: theme.textTheme.headline5,
            );
          default:
            return Text(
              'Not found page',
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

const primaryColor = Color(0xFF685BFF);
final canvasColor = "#2B343B".toColor();
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);

final divider = Divider(color: white.withOpacity(0.3), height: 0);
