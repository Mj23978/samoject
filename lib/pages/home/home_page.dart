import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:samoject_table/samoject_table.dart';

import '../../core/providers.dart';
import 'space_page.dart';

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
                  child: TextButton(
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
                                      provider.sidebarSettingsMenuController
                                              .value ==
                                          TooltipStatus.isShowing)
                                    JustTheTooltip(
                                      onShow: () {},
                                      onDismiss: () {},
                                      backgroundColor: Colors.white,
                                      controller: provider
                                          .sidebarSettingsMenuController,
                                      tailLength: 0,
                                      tailBaseWidth: 0.0,
                                      isModal: true,
                                      preferredDirection: AxisDirection.down,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 10),
                                      borderRadius: BorderRadius.circular(8.0),
                                      offset: 10,
                                      content: SidebarSettingsTooltip(),
                                      child: InkWell(
                                        onTap: () {
                                          provider.sidebarSettingsMenuController
                                              .showTooltip();
                                        },
                                        onHover: (value) {},
                                        hoverColor:
                                            Colors.blue.withOpacity(0.15),
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
                          child: SpaceActionBar(provider: provider),
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

class SidebarSettingsTooltip extends ConsumerWidget {
  const SidebarSettingsTooltip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return AppPopupMenu(
      items: provider.sidebarSettingsPopupItems,
      provider: provider,
      title: "Sidebar Settings",
    );
  }
}
