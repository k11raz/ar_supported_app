import 'package:bus/app/app.dart';
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

  sl
    ..registerFactory(() => AuthBloc(signUpUseCase: sl()))
    ..registerLazySingleton(() => SignUpUseCase(sl()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => SupabaseAuthRemoteDataSource(dio: sl()),
    )
    ..registerLazySingleton(Dio.new);

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
      () => SupabaseProductRemoteDatasource(),
    );

  sl
    ..registerFactory(
      () => FavoritesBloc(addToFavoritesUseCase: sl(), getFavorites: sl()),
    )
    ..registerLazySingleton(() => AddToFavoritesUseCase(sl()))
    ..registerLazySingleton(() => GetFavorites(sl()))
    ..registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(sl()),
    )
    ..registerLazySingleton<FavoritesRemoteDataSource>(
      () => SupabaseFavoritesRemoteDataSource(),
    );

  sl
    ..registerFactory(() => CategoryBloc(getCategory: sl()))
    ..registerLazySingleton(() => GetCategory(sl()))
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()),
    )
    ..registerLazySingleton<CategoryRemoteDataSource>(
      () => SupabaseCategoryRemoteDatasource(),
    );

  sl
    ..registerFactory(
      () => CardBloc(addToCartUseCase: sl(), getOrderItems: sl()),
    )
    ..registerLazySingleton(() => AddToCartUseCase(sl()))
    ..registerLazySingleton(() => GetOrderItems(sl()))
    ..registerLazySingleton<CardRepository>(() => CardRepositoryImpl(sl()))
    ..registerLazySingleton<CardRemoteDataSource>(
      () => SupabaseCardRemoteDatasource(),
    );
}
