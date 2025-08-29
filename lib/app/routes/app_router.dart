import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LandingRoute.page,
      initial: true,
      
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(
          page: MainTabRoute.page,
          children: [
            AutoRoute(page: BasketRoute.page, initial: true),
            AutoRoute(page: FavoritesRoute.page),
          ],
        ),
        AutoRoute(page: UserRoute.page),
        AutoRoute(page: SettingUserRoute.page),
      ],
      
    ),
    AutoRoute(page: ProductDetailRoute.page),
    AutoRoute(page: ProductCategoryRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: FavoritesRoute.page),
  ];
}
