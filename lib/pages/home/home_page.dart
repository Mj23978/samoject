import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:samoject_table/samoject_table.dart';
import 'package:searchfield/searchfield.dart';

import '../../core/providers.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

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
                color: Colors.red,
              ),
            ),
          Flexible(
            flex: 19,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.yellow,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 1),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        prefixIcon: Icon(Icons.search, size: 20),
                                        prefixIconColor: Colors.black38,
                                        labelText: '  Search Tasks ...',
                                        labelStyle: TextStyle(fontSize: 10)),
                                  ),
                                ),
                              ),
                              AnimatedDropDownButton(),
                              SizedBox(width: 4),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Divider(
                                  height: 4,
                                  color: Colors.black38,
                                  indent: 7,
                                  endIndent: 7,
                                  thickness: 0.5,
                                ),
                              ),
                              SizedBox(
                                width: 560 - 480,
                              ),
                              Flexible(
                                flex: 6,
                                child: Container(),
                              )
                            ],
                          ),
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
                            onChanged: (SamojectTableGridOnChangedEvent event) {
                              print(event);
                            },
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

class AnimatedDropDownButton extends HookConsumerWidget {
  final Duration duration;

  const AnimatedDropDownButton({
    this.duration = const Duration(milliseconds: 400),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useAnimationController(duration: duration);
    final bool _isDropdownOpen = useMemoized(() {
      return false;
    });
    final Animation<double> _rotationAnimation = useMemoized(() {
      return Tween<double>(begin: 0, end: 0.5).animate(_controller);
    }, []);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return InkWell(
          onTap: () {
            if (!_controller.isAnimating && _controller.isCompleted) {
              _controller.reverse();
            } else if (!_controller.isAnimating) {
              _controller.forward();
            }
          },
          child: RotationTransition(
            turns: _rotationAnimation,
            child: const Icon(Icons.keyboard_arrow_down, color: Colors.black38, size: 18,),
          ),
        );
      },
    );
  }
}
