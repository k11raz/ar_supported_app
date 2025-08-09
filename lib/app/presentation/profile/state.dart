import 'package:equatable/equatable.dart';
import 'package:bus/app/domain/entities/user.dart';

abstract class UsersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;
  UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UsersError extends UsersState {
  final String message;
  UsersError(this.message);

  @override
  List<Object?> get props => [message];
}
