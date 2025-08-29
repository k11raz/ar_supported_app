import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

@RoutePage()
class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: sl<UserCacheService>().isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final loggedIn = snapshot.data!;
        // final loggedIn = false;
        final userTab = loggedIn ? SettingUserRoute() : UserRoute();

        return AutoTabsScaffold(
          routes: [
            HomeRoute(),
            SearchRoute(),
            MenuRoute(),
            MainTabRoute(),
            userTab,
          ],
          bottomNavigationBuilder: (context, tabsRouter) {
            return Container(
              height: 80,
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) {
                  final icons = [
                    Icons.home_outlined,
                    Icons.search_outlined,
                    Icons.circle_outlined,
                    Icons.shopping_bag_outlined,
                    Icons.person,
                  ];
                  final isActive = tabsRouter.activeIndex == index;

                  return GestureDetector(
                    onTap: () {
                      tabsRouter.setActiveIndex(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[index],
                            color: isActive ? Colors.white : Colors.grey,
                          ),
                          const SizedBox(height: 2),
                          Container(
                            width: 8,
                            height: 2,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}
