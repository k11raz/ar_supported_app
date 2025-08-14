import 'package:bus/app/domain/usecases/auth/sign_up.dart';
import 'package:bus/app/presentation/signup/event.dart';
import 'package:bus/app/presentation/signup/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.signUpUseCase) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUpEvent);
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signUpUseCase(
        email: event.email,
        password: event.password,
        name: event.name,
        surname: event.surname,
        phone: event.phone,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
