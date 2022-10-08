import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:info_popup/info_popup.dart';
import 'package:samoject_table/samoject_table.dart';

import '../../core/notifiers/home_provider.dart';
import '../../core/providers.dart';

const Key infoPopupTextExampleKey = Key('info_popup_text_example');
const String infoPopupTextExampleText = 'This is a popup';

const Key infoPopupCustomExampleKey = Key('info_popup_custom_example');
const String infoPopupCustomExampleText = 'This is a custom widget';

const Key infoPopupLongTextExampleKey = Key('info_popup_long_text_example');
const String infoPopupLongTextExampleText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra. Consectetur adipiscing elit ut aliquam purus sit. Nisl vel pretium lectus quam. Et odio pellentesque diam volutpat commodo. Diam vulputate ut pharetra sit amet aliquam id diam maecenas. Malesuada fames ac turpis egestas. Et sollicitudin ac orci phasellus egestas tellus rutrum. Pretium lectus quam id leo in. Semper risus in hendrerit gravida. Nullam ac tortor vitae purus faucibus ornare suspendisse sed. Non tellus orci ac auctor. Quis risus sed vulputate odio ut enim blandit.
\n
Nullam eget felis eget nunc lobortis mattis aliquam faucibus purus. Aenean et tortor at risus viverra adipiscing at in. Augue eget arcu dictum varius duis at consectetur. Est pellentesque elit ullamcorper dignissim cras. At consectetur lorem donec massa sapien faucibus et. Sit amet venenatis urna cursus eget. Dignissim cras tincidunt lobortis feugiat vivamus. Eget arcu dictum varius duis at. Aenean pharetra magna ac placerat. Enim nec dui nunc mattis enim ut tellus elementum. Laoreet suspendisse interdum consectetur libero. Tellus mauris a diam maecenas sed enim. Tortor posuere ac ut consequat semper viverra nam libero. Tellus molestie nunc non blandit massa.
''';

const Key infoPopupArrowGapExampleKey = Key('info_popup_arrow_gap_example');
const String infoPopupArrowGapExampleText = infoPopupLongTextExampleText;

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return Scaffold(
      body: Column(
        children: [
          if (true)
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: HomeFavoritesSection(
                  provider: provider,
                ),
              ),
            ),
          Flexible(
            flex: 19,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                    ),
                    height: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/app-logo.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Samoject",
                                  style: GoogleFonts.gemunuLibre(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  onHover: (value) {},
                                  hoverColor: Colors.blue.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(3),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.teal.shade700,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2),
                                InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.blue.withOpacity(0.15),
                                  onHover: (value) {},
                                  borderRadius: BorderRadius.circular(3),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    child: Icon(
                                      Icons.keyboard_double_arrow_left_sharp,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade800,
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () {},
                            onHover: provider.onSideSearchHovered,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 18,
                                    color: provider.sideSearchHovered
                                        ? Colors.blue
                                        : Colors.black45,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Search",
                                    style: TextStyle(
                                        color: provider.sideSearchHovered
                                            ? Colors.blue
                                            : Colors.black45,
                                        fontSize: 12),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Ctrl+K",
                                    style: TextStyle(
                                        color: provider.sideSearchHovered
                                            ? Colors.blue
                                            : Colors.black45,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SideMenuSimpleItem(
                          name: "Home",
                          provider: provider,
                          iconData: Icons.home_outlined,
                        ),
                        SideMenuSimpleItem(
                            name: "Notifications",
                            provider: provider,
                            iconData: Icons.notifications_outlined),
                        SideMenuSimpleItem(
                          name: " Goals",
                          provider: provider,
                          iconData: FontAwesomeIcons.trophy,
                          iconSize: 15,
                        ),
                        SideMenuSimpleItem(
                          name: "Show less",
                          provider: provider,
                          iconData: Icons.arrow_upward_outlined,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.blueGrey,
                          thickness: 0.5,
                          height: 0,
                        ),
                        SideMenuSectionItem(
                          name: "Spaces",
                          showSearch: false,
                          provider: provider,
                        ),
                        Divider(
                          color: Colors.blueGrey,
                          thickness: 0.5,
                          height: 0,
                        ),
                        SideMenuSectionItem(
                          name: "Dashboards",
                          showSearch: false,
                          provider: provider,
                        ),
                        Divider(
                          color: Colors.blueGrey,
                          thickness: 0.5,
                          height: 0,
                        ),
                        SideMenuSectionItem(
                          name: "Docs",
                          showSearch: false,
                          provider: provider,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.transparent,
                          child: SpaceHeaderViews(
                            provider: provider,
                          ),
                        ),
                      ),
                      Divider(height: 2),
                      Flexible(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                          child: SpaceActionBar(),
                        ),
                      ),
                      Flexible(
                        flex: 25,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: SamojectTableGrid(
                            columns: provider.columns,
                            rows: provider.rows,
                            // columnGroups: columnGroups,
                            onLoaded: (SamojectTableGridOnLoadedEvent event) {
                              provider.setTableStateManager(event.stateManager);
                            },
                            onChanged: print,
                            configuration:
                                const SamojectTableGridConfiguration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideMenuSectionItem extends StatelessWidget {
  final String name;
  final bool showSearch;
  final HomeProvider provider;

  const SideMenuSectionItem({
    Key? key,
    required this.name,
    required this.showSearch,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      onHover: (value) {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Row(
          children: [
            Text(
              name,
              style: GoogleFonts.gemunuLibre(
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            if (showSearch)
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(0, 0)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 4))),
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.blueGrey,
                ),
              ),
            SizedBox(width: 6),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuSimpleItem extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final double? iconSize;
  final Widget? icon;
  final HomeProvider provider;

  const SideMenuSimpleItem({
    Key? key,
    required this.name,
    required this.provider,
    this.iconData,
    this.iconSize = 18,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      onHover: (value) {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Row(
          children: [
            if (iconData != null)
              Icon(
                iconData,
                size: iconSize,
                color: Colors.blueGrey,
              ),
            if (icon != null) icon!,
            SizedBox(width: 5),
            Text(
              name,
              style: TextStyle(color: Colors.blueGrey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFavoritesSection extends StatelessWidget {
  final HomeProvider provider;

  const HomeFavoritesSection({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Favorites",
          style: GoogleFonts.alata(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 10),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 20),
          child: RotatedBox(
            quarterTurns: 1,
            child: Divider(
              height: 4,
              color: Colors.grey,
              indent: 2,
              endIndent: 2,
              thickness: 0.8,
            ),
          ),
        ),
        SizedBox(width: 4),
        TextButton(
          onPressed: () {},
          onHover: (value) {
            provider.onHoverFavorite('Get to know clickup', value);
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          child: Text(
            "Get to know clickup",
            style: TextStyle(
              color: provider.favorites
                      .singleWhere((e) => e.name == 'Get to know clickup')
                      .onHovered
                  ? Colors.blue
                  : Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 10),
        Spacer(),
        InkWell(
          onTap: () {},
          onHover: (value) {},
          borderRadius: BorderRadius.circular(3),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: SvgPicture.asset(
              'assets/icons/pin_2.svg',
              height: 14,
              width: 14,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}

class SpaceHeaderViews extends StatelessWidget {
  final HomeProvider provider;

  const SpaceHeaderViews({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 24),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.teal.shade700,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            "M",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              mouseCursor: MaterialStateProperty.all(
                MouseCursor.uncontrolled,
              ),
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(right: 1, left: 8))),
          onHover: provider.onTiltleHovered,
          child: Row(
            children: [
              Text(
                "mohammad hosseini's Space",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Opacity(
                opacity: provider.titleHovered ? 1 : 0,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.black38,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SpaceHeaderView(
          name: "List",
          iconData: Icons.list,
          provider: provider,
        ),
        SpaceHeaderView(
          name: "Board",
          icon: SvgPicture.asset(
            'assets/icons/kanban_2.svg',
            height: 18,
            width: 18,
            color: Colors.black38,
          ),
          provider: provider,
        ),
        SpaceHeaderView(
          name: "Box",
          icon: SvgPicture.asset(
            'assets/icons/squares.svg',
            height: 20,
            width: 20,
            color: Colors.black38,
          ),
          provider: provider,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 40),
          child: const RotatedBox(
            quarterTurns: 1,
            child: Divider(
              height: 4,
              color: Colors.black38,
              indent: 7,
              endIndent: 7,
              thickness: 1,
            ),
          ),
        ),
        SizedBox(width: 2),
        SpaceActionIcon(
          name: 'View',
          iconData: Icons.add,
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          constraints: BoxConstraints(maxHeight: 40),
          child: OutlinedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.robot,
                  color: Colors.black38,
                  size: 15,
                ),
                SizedBox(width: 12),
                Text(
                  "Automate",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 6),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 30),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      height: 4,
                      color: Colors.black26,
                      indent: 6,
                      endIndent: 6,
                      thickness: 1,
                    ),
                  ),
                ),
                SizedBox(width: 6),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.black38,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 24),
      ],
    );
  }
}

class SpaceHeaderView extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final double? iconSize;
  final Widget? icon;
  final HomeProvider provider;

  const SpaceHeaderView({
    required this.name,
    required this.provider,
    this.icon,
    this.iconData,
    this.iconSize = 20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final view = provider.views.singleWhere((e) => e.name == name);
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 40),
          child: const RotatedBox(
            quarterTurns: 1,
            child: Divider(
              height: 4,
              color: Colors.black38,
              indent: 7,
              endIndent: 7,
              thickness: 1,
            ),
          ),
        ),
        SizedBox(width: 2),
        Container(
          height: 1000,
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 3, color: Colors.transparent),
            bottom: view.onHovered || view.selected
                ? BorderSide(color: Colors.blue, width: 3)
                : BorderSide(color: Colors.transparent, width: 3),
          )),
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              print("object");
              provider.onSelectView(name);
            },
            onHover: ((value) {
              provider.onHoverView(name, value);
            }),
            child: Row(
              children: [
                if (iconData != null)
                  Icon(
                    iconData,
                    color: Colors.black38,
                    size: iconSize,
                  ),
                if (icon != null) icon!,
                SizedBox(width: 4),
                Text(
                  name,
                  style: GoogleFonts.alata(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                if (view.onHovered && view.selected)
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.black38,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 2,
        )
      ],
    );
  }
}

class SpaceActionBar extends StatelessWidget {
  const SpaceActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Container(
          constraints: BoxConstraints(maxWidth: 150),
          margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 1),
          child: const TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Icon(Icons.search, size: 20),
                prefixIconColor: Colors.black38,
                labelText: '  Search Tasks ...',
                labelStyle: TextStyle(fontSize: 10)),
          ),
        ),
        AnimatedDropDownButton(),
        const SizedBox(width: 4),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 30),
          child: const RotatedBox(
            quarterTurns: 1,
            child: Divider(
              height: 4,
              endIndent: 3,
              indent: 3,
              color: Colors.black38,
              thickness: 0.5,
            ),
          ),
        ),
        Spacer(),
        SpaceActionIcon(name: "Filter", iconData: Icons.filter_list),
        SpaceActionIcon(
            name: "Group By : Status",
            iconData: FontAwesomeIcons.layerGroup,
            iconDataSize: 15),
        SpaceActionIcon(
          name: "Subtasks : Seprately",
          icon: SvgPicture.asset(
            'assets/icons/subtask.svg',
            height: 20,
            width: 20,
            color: Colors.black38,
          ),
        ),
        SpaceActionIcon(
          name: "Show",
          iconData: FontAwesomeIcons.eye,
          iconDataSize: 15,
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(3),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Icon(
              Icons.more_horiz_outlined,
              color: Colors.black38,
              size: 15,
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

class SpaceActionIcon extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final double iconDataSize;
  final Widget? icon;

  const SpaceActionIcon({
    Key? key,
    required this.name,
    this.iconData,
    this.iconDataSize = 18,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        child: Row(
          children: [
            if (icon != null)
              icon!
            else if (iconData != null)
              Icon(
                iconData!,
                color: Colors.black38,
                size: iconDataSize,
              ),
            SizedBox(width: 8),
            Text(name, style: TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

class AnimatedDropDownButton extends HookConsumerWidget {
  final Duration duration;

  const AnimatedDropDownButton({
    this.duration = const Duration(milliseconds: 200),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: duration);
    InfoPopupController? infoPopupCustomWidgetController;
    final bool isDropdownOpen = useMemoized(() {
      return false;
    });
    final Animation<double> rotationAnimation = useMemoized(() {
      return Tween<double>(begin: 0, end: 0.5).animate(controller);
    }, []);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return InkWell(
          key: infoPopupCustomExampleKey,
          onTap: () {
            if (!controller.isAnimating && controller.isCompleted) {
              controller.reverse();
            } else if (!controller.isAnimating) {
              controller.forward();
              if (infoPopupCustomWidgetController != null) {
                infoPopupCustomWidgetController!.show();
              }
            }
          },
          child: InfoPopupWidget(
            onControllerCreated: (InfoPopupController controller) {
              infoPopupCustomWidgetController ??= controller;
            },
            infoPopupDismissed: () {
              if (!controller.isAnimating && controller.isCompleted) {
                controller.reverse();
              }
            },
            arrowTheme: const InfoPopupArrowTheme(
              color: Colors.black87,
              arrowDirection: ArrowDirection.down,
            ),
            infoWidget: Container(
              width: context.percentWidth * 90,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  infoPopupCustomExampleText,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            child: RotationTransition(
              turns: rotationAnimation,
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black38,
                size: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}