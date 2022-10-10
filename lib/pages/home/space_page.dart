import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core/notifiers/home_provider.dart';
import '../../core/providers.dart';

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
              JustTheTooltip(
                onShow: () {},
                onDismiss: () {},
                backgroundColor: Colors.white,
                controller: provider.spaceTitleMoreController,
                tailLength: 0,
                tailBaseWidth: 0.0,
                isModal: true,
                preferredDirection: AxisDirection.down,
                margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                borderRadius: BorderRadius.circular(8.0),
                offset: 10,
                content: SpaceHeaderMoreTooltip(),
                child: Opacity(
                  opacity: (provider.titleHovered ||
                          provider.spaceTitleMoreController.value ==
                              TooltipStatus.isShowing)
                      ? 1
                      : 0,
                  child: InkWell(
                    onTap: () {
                      provider.spaceTitleMoreController.showTooltip();
                    },
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
  final HomeProvider provider;

  const SpaceActionBar({
    Key? key,
    required this.provider,
  }) : super(key: key);

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
        AnimatedDropDownButton(
          animationKey: Key("SpaceSearchMenu"),
          content: SpaceActionTraySearchItems(),
          tooltipController: provider.spaceActionTraySearchController,
          onTap: () {
            // provider.spaceActionTraySearchController.showTooltip();
          },
        ),
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

class SpaceActionTraySearchItems extends ConsumerWidget {
  const SpaceActionTraySearchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return AppPopupMenu(
      title: "SEARCH IN",
      width: 180,
      items: provider.spaceActionTraySearchAction,
      provider: provider,
      numberOfSection: provider.spaceActionTraySearchAction.last.section + 1,
      addHeight: 10,
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
  final Function? onTap;
  final Function? onDismiss;
  final Key animationKey;
  final JustTheController tooltipController;
  final Widget content;

  const AnimatedDropDownButton({
    required this.animationKey,
    required this.tooltipController,
    required this.content,
    this.duration = const Duration(milliseconds: 200),
    this.onTap,
    this.onDismiss,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: duration);
    final Animation<double> rotationAnimation = useMemoized(() {
      return Tween<double>(begin: 0, end: 0.5).animate(controller);
    }, []);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return InkWell(
          key: Key("animationKey"),
          onTap: () {            
            if (!controller.isAnimating && controller.isCompleted) {
              controller.reverse();
              if (onDismiss != null) {
                onDismiss!();
              }
            } else if (!controller.isAnimating) {
              controller.forward();
              // if (onTap != null) {
              //   onTap!();
              // }
            }
          },
          child: JustTheTooltip(
            onShow: () {},
            onDismiss: () {},
            backgroundColor: Colors.white,
            controller: tooltipController,
            tailLength: 0,
            tailBaseWidth: 0.0,
            isModal: true,
            preferredDirection: AxisDirection.down,
            margin: EdgeInsets.only(top: 100),
            borderRadius: BorderRadius.circular(8.0),
            offset: 10,
            content: content,
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

class SpaceHeaderMoreTooltip extends ConsumerWidget {
  const SpaceHeaderMoreTooltip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return AppPopupMenu(
      items: provider.spaceTitleMoreAction,
      provider: provider,
      numberOfSection: provider.spaceTitleMoreAction.last.section + 1,
    );
  }
}

class AppPopupMenu extends StatelessWidget {
  final List<AppPopupMenuItem> items;
  final HomeProvider provider;
  final String? title;
  final double width;
  final double addHeight;
  final int numberOfSection;

  const AppPopupMenu({
    Key? key,
    required this.items,
    required this.provider,
    this.title,
    this.width = 200,
    this.addHeight = 0,
    this.numberOfSection = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int section = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: (items.length * 32) +
                (title != null ? 30 : 10) +
                (numberOfSection * 6) +
                addHeight,
          ),
          child: Column(
            children: [
              SizedBox(height: 6),
              if (title != null) ...[
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text(
                    title!,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 8)
              ],
              for (var i = 0; i < items.length; i++) ...[
                ...() {
                  if (items[i].section > section) {
                    section++;
                    return [
                      SizedBox(
                        height: 4,
                      ),
                      Divider(
                        height: 2,
                        thickness: 1.5,
                        indent: 4,
                        endIndent: 4,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ];
                  }
                  return [
                    SizedBox(
                      height: 4,
                    )
                  ];
                }(),
                wrapWithTooltip(
                    items[i].subItems.isNotEmpty,
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: width),
                      child: TextButton(
                        onPressed: () async {
                          if (items[i].subItems.isNotEmpty) {
                            if (items[i].controller == null) {
                              items[i].controller = JustTheController();
                            }
                            items[i].controller?.showTooltip();
                          }
                          if (items[i].addSwitch == true) {
                            provider.setPopupMenuItemsSwitch(
                              items,
                              i,
                              !items[i].switchValue,
                            );
                          }
                        },
                        style: ButtonStyle(
                            // padding: MaterialStateProperty.all(
                            //   EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                            // ),
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...(items[i].prefixWidgets),
                            if (items[i].isNew)
                              Container(
                                margin: EdgeInsets.only(left: 4),
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.purple.shade100
                                        .withOpacity(0.7)),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            Spacer(),
                            if (items[i].addSwitch)
                              SizedBox(
                                height: 32,
                                width: 45,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Switch(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: items[i].switchValue,
                                    onChanged: (value) =>
                                        provider.setPopupMenuItemsSwitch(
                                      items,
                                      i,
                                      value,
                                    ),
                                  ),
                                ),
                              ),
                            ...(items[i].suffixWidgets),
                            if (items[i].subItems.isNotEmpty)
                              Icon(Icons.arrow_forward_ios_rounded, size: 10),
                          ],
                        ),
                      ),
                    ),
                    AppPopupMenu(
                      items: items[i].subItems,
                      provider: provider,
                      title: items[i].subItemsHeader,
                      width: 185,
                      numberOfSection: items[i].subItems.isNotEmpty
                          ? items[i].subItems.last.section + 1
                          : 1,
                    ),
                    items[i].controller),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Widget wrapWithTooltip(
    bool wrap, Widget child, Widget content, JustTheController? controller) {
  return wrap
      ? JustTheTooltip(
          onShow: () {},
          onDismiss: () {},
          backgroundColor: Colors.white,
          controller: controller,
          tailLength: 0,
          tailBaseWidth: 0.0,
          isModal: true,
          preferredDirection: AxisDirection.right,
          margin: EdgeInsets.only(top: 100),
          borderRadius: BorderRadius.circular(8.0),
          offset: 10,
          content: content,
          child: child,
        )
      : child;
}
