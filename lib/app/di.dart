import 'package:bus/app/services/cache/cache_service.dart';
import 'package:bus/app/services/cache/user_cache.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> dependencyInjection() async {
  final cacheService = CacheService();
  //await cacheService.init(); // eğer init gerekiyorsa

  // Servisleri register et
  sl.registerSingleton<CacheService>(cacheService);
  sl.registerLazySingleton<UserCacheService>(
    () => UserCacheService(sl<CacheService>()),
  );
}
