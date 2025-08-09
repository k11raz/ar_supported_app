import 'package:bus/app/domain/entities/user.dart';
import 'package:bus/app/domain/usecases/get_user.dart';
import 'package:bus/app/presentation/search/event.dart';
import 'package:bus/app/presentation/search/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;

  UserBloc(this.getUsers) : super(UserInitial()) {
    on<LoadUsers>(_onLoadUsers);
  }

  Future<void> _onLoadUsers(
    LoadUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final List<UserEntity> users = await getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('Kullanıcılar yüklenemedi.'));
    }
  }
}
