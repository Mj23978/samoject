import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers.dart';
import 'template_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return Scaffold(
      body: Column(
        children: [
          if (provider.pinFavorites)
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
              children: const [
                Flexible(
                  flex: 2,
                  child: SidebarWidgets(),
                ),
                Flexible(
                  flex: 8,
                  child: SpaceTemplateView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
