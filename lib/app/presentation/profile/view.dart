import 'package:auto_route/auto_route.dart';
import 'package:bus/app/data/datasources/remote/auth.dart';
import 'package:bus/app/data/repositories/auth_impl.dart';
import 'package:bus/app/domain/usecases/auth/sign_in.dart';
import 'package:bus/app/presentation/profile/bloc.dart';
import 'package:bus/app/presentation/profile/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';

@RoutePage()
class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final authRemoteDataSource = SupabaseAuthRemoteDataSource(dio: DioClient.dio);
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);
    final signInUseCase = SignInUseCase(authRepository);
    return BlocProvider(
      create: (_) => LoginBloc(signInUseCase),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SignInForm(),
                  
                  SizedBox(height: 4),
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                        ),
                        child: Text(
                          "Bir hesabınız yok mu?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        onPressed: () {
                          context.router.push(SignupRoute());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
