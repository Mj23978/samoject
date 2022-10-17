import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core/notifiers/home_provider.dart';
import '../../core/providers.dart';
import '../../widgets/buttons/space_menu_button.dart';
import '../../widgets/overlays/menu_with_buttons.dart';
import '../space/box_view.dart';
import '../space/space_view.dart';

class SpaceTemplateView extends ConsumerWidget {
  const SpaceTemplateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return Column(
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
            child: SpaceActionBar(provider: provider),
          ),
        ),
        Flexible(
          flex: 25,
          child: BoxView(),
        ),
      ],
    );
  }
}

class SidebarWidgets extends HookConsumerWidget {
  const SidebarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return TextButton(
      onHover: provider.onHoverSidebar,
      style: ButtonStyle(
        mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () {},
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
                    if (provider.sidebarHovered ||
                        provider.sidebarSettingsMenuController.value ==
                            TooltipStatus.isShowing)
                      JustTheTooltip(
                        onShow: () {},
                        onDismiss: () {},
                        backgroundColor: Colors.white,
                        tailLength: 0,
                        tailBaseWidth: 0.0,
                        isModal: true,
                        preferredDirection: AxisDirection.down,
                        margin:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                        borderRadius: BorderRadius.circular(8.0),
                        offset: 10,
                        content: MenuWithButton(
                          items: sidebarSettingsPopupItems,
                          title: "Sidebar Settings",
                        ),
                        controller: provider.sidebarSettingsMenuController,
                        child: InkWell(
                          onTap: () {
                            provider.sidebarSettingsMenuController
                                .showTooltip();
                          },
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
                      ),
                    SizedBox(width: 2),
                    InkWell(
                      onTap: () {},
                      hoverColor: Colors.blue.withOpacity(0.15),
                      onHover: (value) {},
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 3),
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
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
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
            if (!provider.pinFavorites) ...[
              Divider(
                color: Colors.blueGrey,
                thickness: 0.5,
                height: 0,
              ),
              SideMenuSectionItem(
                name: "Favorites",
                showSearch: false,
                showPin: true,
                onPin: () {
                  provider.togglePinFavorites();
                },
                provider: provider,
              )
            ],
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
    );
  }
}

class SideMenuSectionItem extends StatelessWidget {
  final String name;
  final bool showSearch;
  final bool showPin;
  final HomeProvider provider;
  final Function()? onSearch;
  final Function()? onPressed;
  final Function()? onPin;
  final Function(bool)? onHover;

  const SideMenuSectionItem({
    Key? key,
    required this.name,
    required this.provider,
    this.onPressed,
    this.onHover,
    this.onSearch,
    this.onPin,
    this.showSearch = false,
    this.showPin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onHover: onHover,
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
                onPressed: onSearch,
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
            if (showPin)
              TextButton(
                onPressed: onPin,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(0, 0)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/pin_2.svg',
                  height: 10,
                  width: 10,
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
          onTap: provider.togglePinFavorites,
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
