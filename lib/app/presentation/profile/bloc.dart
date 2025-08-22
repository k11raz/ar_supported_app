import 'package:bus/app/data/models/user_model.dart';
import 'package:bus/app/domain/usecases/auth/sign_in.dart';
import 'package:bus/app/presentation/profile/event.dart';
import 'package:bus/app/presentation/profile/state.dart';
import 'package:bus/app/services/cache/user_cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase signInUseCase;
  

  LoginBloc({required this.signInUseCase})
    : super(LoginInitial()) {
    on<SignInEvent>(onSignInEvent);
  }

  Future<void> onSignInEvent(
    SignInEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await signInUseCase(
        email: event.email,
        password: event.password,
      );
    

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
