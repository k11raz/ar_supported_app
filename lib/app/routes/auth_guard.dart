import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = await sl<UserCacheService>().getAccessToken();

    if (token == null || JwtDecoder.isExpired(token)) {
      await sl<UserCacheService>().removeUser();
      router.push(const UserRoute());
    } else {
      resolver.next(true);
    }
  }
}
