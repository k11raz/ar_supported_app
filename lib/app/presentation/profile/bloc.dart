import 'package:bus/app/domain/usecases/get_user.dart';
import 'package:bus/app/presentation/profile/event.dart';
import 'package:bus/app/presentation/profile/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsers getUsers;

  UsersBloc(this.getUsers) : super(UsersInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(
    FetchUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoading());
    try {
      final users = await getUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}
