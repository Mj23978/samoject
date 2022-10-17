import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../core/notifiers/home_provider.dart';
import '../../widgets/buttons/space_menu_button.dart';
import '../../widgets/overlays/animated_dropdown_button.dart';
import '../../widgets/overlays/menu_with_buttons.dart';

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
                content: MenuWithButton(
                  items: spaceTitleMoreAction,
                  numberOfSection: spaceTitleMoreAction.last.section + 1,
                ),
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
          onTap: () {},
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
          content: MenuWithButton(
            title: "SEARCH IN",
            width: 170,
            items: spaceActionTraySearchAction,
            numberOfSection: spaceActionTraySearchAction.last.section + 1,
            addHeight: 10,
          ),
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
        SpaceActionIcon(
          name: "Filter",
          iconData: Icons.filter_list,
          onTap: () {},
        ),
        wrapWithMenu(
          wrap: true,
          preferredDirection: AxisDirection.down,
          child: SpaceActionIcon(
            name: "Sort by",
            icon: SvgPicture.asset(
              'assets/icons/arrows_down_top.svg',
              height: 16,
              width: 16,
              color: Colors.black45,
            ),
            onTap: () {
              provider.spaceActionTraySortByController.showTooltip();
            },
          ),
          content: MenuWithButton(
            width: 130,
            items: spaceActionTraySortBy,
            title: "SORT BY",
          ),
          controller: provider.spaceActionTraySortByController,
        ),
        wrapWithMenu(
          wrap: true,
          preferredDirection: AxisDirection.down,
          child: SpaceActionIcon(
            name: "Group by : Status",
            iconData: FontAwesomeIcons.layerGroup,
            iconDataSize: 15,
            onTap: () {
              provider.spaceActionTrayGroupbyController.showTooltip();
            },
          ),
          content: MenuWithButton(
            width: 170,
            items: spaceActionTrayGroupbyActions,
            title: "GROUP BY",
          ),
          controller: provider.spaceActionTrayGroupbyController,
        ),
        wrapWithMenu(
          wrap: true,
          preferredDirection: AxisDirection.down,
          child: SpaceActionIcon(
            name: "Subtasks",
            icon: SvgPicture.asset(
              'assets/icons/subtask.svg',
              height: 20,
              width: 20,
              color: Colors.black38,
            ),
            onTap: () {
              provider.spaceActionTraySubtasksController.showTooltip();
            },
          ),
          content: MenuWithButton(
            width: 150,
            items: spaceActionTraySubtasksAction,
            title: "SHOW SUBTASKS",
          ),
          controller: provider.spaceActionTraySubtasksController,
        ),
        wrapWithMenu(
          wrap: true,
          preferredDirection: AxisDirection.down,
          child: SpaceActionIcon(
            name: "Show",
            iconData: FontAwesomeIcons.eye,
            iconDataSize: 15,
            onTap: () {
              provider.spaceActionTrayShowController.showTooltip();
            },
          ),
          content: MenuWithButton(
            items: spaceActionTrayShowActions,
            title: "SHOW",
            addHeight: 40,
          ),
          controller: provider.spaceActionTrayShowController,
        ),
        wrapWithMenu(
          wrap: true,
          preferredDirection: AxisDirection.down,
          child: InkWell(
            onTap: () {
              provider.spaceActionTrayMoreController.showTooltip();
            },
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
          content: MenuWithButton(
            items: spaceActionTrayMoreActions,
            title: "VIEW SETTINGS",
            addHeight: 40,
          ),
          controller: provider.spaceActionTrayMoreController,
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
  final Function() onTap;

  const SpaceActionIcon({
    Key? key,
    required this.name,
    required this.onTap,
    this.iconData,
    this.iconDataSize = 18,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          if (icon != null)
            icon!
          else if (iconData != null)
            Icon(
              iconData!,
              color: Colors.black45,
              size: iconDataSize,
            ),
          SizedBox(width: 8),
          Text(name, style: TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }
}
