import 'package:auto_route/auto_route.dart';
import 'package:bus/app/routes/app_router.gr.dart';

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
            AutoRoute(page: BasketRoute.page),
            AutoRoute(page: UserRoute.page),
          ],
        ),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: SettingRoute.page),
        
      ];
}
