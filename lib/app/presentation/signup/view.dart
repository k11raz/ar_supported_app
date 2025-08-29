import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';

@RoutePage()
class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    // DataSource -> Repository -> UseCase -> Bloc
    final authRemoteDataSource = SupabaseAuthRemoteDataSource(dio: sl<Dio>(), 
    userCacheService: sl<UserCacheService>());
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);
    final signUpUseCase = SignUpUseCase(authRepository);

    return BlocProvider(
      create: (_) => AuthBloc( signUpUseCase: signUpUseCase),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
