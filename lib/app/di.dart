import 'package:bus/app/app.dart';
import 'package:bus/app/domain/usecases/basket/remove_basket_usecase.dart';
import 'package:bus/app/domain/usecases/favorites/check_favorite.dart';
import 'package:bus/app/domain/usecases/favorites/remove_favorites_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //   sl
  //     ..registerFactory(() => LoginBloc(signInUseCase: sl()))
  //     ..registerLazySingleton(() => SignInUseCase(sl()))
  //     ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
  //     ..registerLazySingleton<AuthRemoteDataSource>(
  //       () => SupabaseAuthRemoteDataSource(dio: sl()),
  //     )
  //     ..registerLazySingleton(Dio.new);

  //cache
  sl.registerLazySingleton<ICacheService>(() => CacheService());

  sl.registerLazySingleton<UserCacheService>(
    () => UserCacheService(sl<ICacheService>()),
  );
  //sl.registerLazySingleton<UserCacheService>(() => UserCacheService(sl()));

  final dio = DioClient().createDio();
  sl.registerLazySingleton<Dio>(() => dio);

  dio.interceptors.add(AuthInterceptor(sl<UserCacheService>()));
  dio.interceptors.add(DioInterceptor());

  //cache

  sl
    ..registerFactory(() => AuthBloc(signUpUseCase: sl()))
    ..registerLazySingleton(() => SignUpUseCase(sl()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => SupabaseAuthRemoteDataSource(dio: sl(), userCacheService: sl()),
    );
  sl
    ..registerFactory(
      () => ProductsBloc(getProducts: sl(), getSearchProducts: sl()),
    )
    ..registerLazySingleton(() => GetProducts(sl()))
    ..registerLazySingleton(() => GetSearchProducts(sl()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ProductRemoteDatasource>(
      () => SupabaseProductRemoteDatasource(dio: sl()),
    );

  sl
    ..registerFactory(
      () => FavoritesBloc(
        addToFavoritesUseCase: sl(),
        getFavorites: sl(),
        checkFavoriteUseCase: sl(),
        removeFavoritesUsecase: sl(),
      ),
    )
    ..registerLazySingleton(() => AddToFavoritesUseCase(sl()))
    ..registerLazySingleton(() => GetFavorites(sl()))
    ..registerLazySingleton(() => CheckFavoriteUseCase(sl()))
    ..registerLazySingleton(() => RemoveFavoritesUsecase(sl()))
    ..registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(sl()),
    )
    ..registerLazySingleton<FavoritesRemoteDataSource>(
      () => SupabaseFavoritesRemoteDataSource(dio: sl()),
    );

  sl
    ..registerFactory(() => CategoryBloc(getCategory: sl()))
    ..registerLazySingleton(() => GetCategory(sl()))
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()),
    )
    ..registerLazySingleton<CategoryRemoteDataSource>(
      () => SupabaseCategoryRemoteDatasource(dio: sl()),
    );

  sl
    ..registerFactory(
      () => CardBloc(
        addToCartUseCase: sl(),
        getOrderItems: sl(),
        removeOrderItemUseCase: sl(),
      ),
    )
    ..registerLazySingleton(() => AddToCartUseCase(sl()))
    ..registerLazySingleton(() => GetOrderItems(sl()))
    ..registerLazySingleton(() => RemoveOrderItemUseCase(sl()))
    ..registerLazySingleton<CardRepository>(() => CardRepositoryImpl(sl()))
    ..registerLazySingleton<CardRemoteDataSource>(
      () => SupabaseCardRemoteDatasource(dio: sl()),
    );
}
