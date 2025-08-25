import '../../domain/entities/user_entity.dart';

abstract class LoginState {}

// SignUp

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}


