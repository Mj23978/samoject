import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:samoject/widgets/charts/task_complete_circular_chart.dart';

import '../../models/task_status/task_status.dart';
import '../../widgets/charts/multi_indicator_bar.dart';
import '../../widgets/overlays/menu_with_buttons.dart';

class BoxView extends StatelessWidget {
  const BoxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xffeeeeee)),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisExtent: 290,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        padding: EdgeInsets.only(
          right: 40,
          top: 20,
          left: 15,
          bottom: 10,
        ),
        children: const [
          BoxViewCard(),
          BoxViewCard(),
          BoxViewCard(),
          BoxViewCard(),
        ],
      ),
    );
  }
}

class BoxViewCard extends StatelessWidget {
  const BoxViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BoxViewCardHeader(),
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "15",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Not done",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "5",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Done",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  TaskCompleteCircularChart()
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            createMultiIndicator([
              IndicatorData(
                0.2,
                Colors.red,
              ),
              IndicatorData(
                0.3,
                Colors.blue,
              ),
            ]),
            SizedBox(
              height: 12,
            ),
            createExpandable(
              title: "To Do",
              color: Colors.cyan.shade200,
            ),
            createExpandable(
              title: "IDEA",
              color: Colors.cyan,
            ),
            createExpandable(
              title: "UNDER REVIEW",
              color: Colors.orange,
            ),
            createExpandable(
              title: "PLANNED",
              color: Colors.teal.shade200,
            ),
            createExpandable(
              title: "IN PROGRESS",
              color: Colors.blue,
            ),
            createExpandable(
              title: "COMPLETE",
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class BoxViewCardHeader extends StatelessWidget {
  const BoxViewCardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 4,
        ),
        CircleAvatar(
          maxRadius: 15,
          minRadius: 10,
          backgroundColor: Colors.teal,
          child: Text(
            "MH",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "You",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        wrapWithTooltip(
          description: "Create Task",
          child: InkWell(
            onTap: () {},
            onHover: (value) {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 3,
              ),
              child: Icon(
                Icons.add,
                color: Colors.teal,
                size: 18,
              ),
            ),
          ),
        ),
        wrapWithTooltip(
          description: "Expand All",
          child: InkWell(
            onTap: () {},
            onHover: (value) {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 3,
              ),
              child: Icon(
                Icons.keyboard_double_arrow_down_outlined,
                color: Colors.teal,
                size: 18,
              ),
            ),
          ),
        ),
        SizedBox(width: 2),
      ],
    );
  }
}

Widget createExpandable({
  required String title,
  required Color color,
}) {
  return ExpandableNotifier(
    child: Column(
      children: [
        Expandable(
          collapsed: ExpandableButton(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              child: Row(
                children: [
                  Icon(Icons.arrow_forward_ios_rounded, size: 12),
                  SizedBox(width: 6),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(2)),
                  ),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          expanded: Column(
            children: [
              ExpandableButton(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_ios_rounded, size: 12),
                      SizedBox(width: 6),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 8),
                  ),
                  // textStyle: MaterialStateProperty.resolveWith((states) {
                  //   if (states.contains(MaterialState.hovered)) {
                  //     return TextStyle(color: Colors.black);
                  //   }
                  //   return null;
                  // })
                ),
                onPressed: () {},
                onHover: (value) {},
                child: Container(
                  constraints: BoxConstraints(maxHeight: 30),
                  child: Row(
                    children: [
                      TaskTile(
                        onTap: () {},
                        animationKey: Key("x side"),
                        tooltipController: JustTheController(),
                        content: Container(),
                      ),
                      Text(
                        "Fix sidebar issue",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class BoxViewChangeStatusTooltipItem extends HookConsumerWidget {
  final Color color;
  final String name;
  final bool selected;

  const BoxViewChangeStatusTooltipItem({
    required this.color,
    required this.name,
    this.selected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final onHovered = useState(false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          onHovered.value = value;
        },
        hoverColor: color,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(2)),
              ),
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(
                  color: onHovered.value
                      ? Colors.white
                      : selected
                          ? Colors.black87
                          : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskTile extends HookConsumerWidget {
  final Duration duration;
  final Function? onTap;
  final Key animationKey;
  final JustTheController tooltipController;
  final Widget content;

  const TaskTile({
    required this.onTap,
    required this.animationKey,
    required this.tooltipController,
    required this.content,
    this.duration = const Duration(milliseconds: 200),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useAnimationController(duration: duration);
    final Animation<Offset> offsetAnimation = useMemoized(() {
      return Tween<Offset>(begin: Offset(0, 0), end: Offset(28, 10))
          .animate(controller);
    }, []);
    final tooltipType = useState(true);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(right: offsetAnimation.value.dy),
          child: InkWell(
            hoverColor: Colors.transparent,
            key: animationKey,
            onTap: () {
              tooltipType.value = !tooltipType.value;
              print(tooltipType.value);
            },
            onHover: (value) {
              if (value) {
                controller.forward();
              } else {
                controller.reverse();
              }
            },
            child: Row(
              children: [
                wrapWithMenu(
                  content: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    constraints: BoxConstraints(maxHeight: 210, maxWidth: 150),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        TaskStatus.todo(),
                        TaskStatus.planned(),
                        TaskStatus.starting(),
                        TaskStatus.underReview(),
                        TaskStatus.inProgress(),
                        TaskStatus.complete(),
                      ].map<Widget>((e) {
                        return BoxViewChangeStatusTooltipItem(
                          color: e.color,
                          name: e.name,
                        );
                      }).toList(),
                    ),
                  ),
                  controller: JustTheController(),
                  wrap: true,
                  onDismiss: () {
                    tooltipType.value = !tooltipType.value;
                    print(tooltipType.value);
                  },
                  // preferredDirection: AxisDirection.down,
                  child: wrapWithTooltip(
                    wrap: false,
                    description: "TO DO",
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
                      child: Container(
                        width: 4 + offsetAnimation.value.dx,
                        height: double.maxFinite,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.7),
                        ),
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.purple.withOpacity(0.5),
                          ),
                        ),
                        // duration: duration,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 10 - offsetAnimation.value.dy,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
