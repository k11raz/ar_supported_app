import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bus/app/app.dart';

@RoutePage()
class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [BasketRoute(), FavoritesRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          appBar: AppBar(leading: const AutoLeadingButton()),
          body: Column(
            children: [
              TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text(
                      "SHOPPING BAG",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "FAVORITES",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
                dividerColor: Colors.transparent,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.white,
              ),

              const SizedBox(height: 16),

              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}
