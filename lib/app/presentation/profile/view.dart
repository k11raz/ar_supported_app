import 'package:auto_route/auto_route.dart';
import 'package:bus/app/data/datasources/remote/user_remote.dart';
import 'package:bus/app/data/repositories/user_impl.dart';
import 'package:bus/app/domain/usecases/get_user.dart';
import 'package:bus/app/presentation/profile/bloc.dart';
import 'package:bus/app/presentation/profile/event.dart';
import 'package:bus/app/presentation/profile/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersBloc(
        GetUsers(
          UserRepositoryImpl(
            SupabaseUserRemoteDatasource(),
          ),
        ),
      )..add(FetchUsersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kullanıcılar"),
          centerTitle: true,
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UsersError) {
              return Center(
                child: Text(
                  "Hata: ${state.message}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is UsersLoaded) {
              if (state.users.isEmpty) {
                return const Center(
                  child: Text(
                    "Henüz kullanıcı yok",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<UsersBloc>().add(FetchUsersEvent());
                },
                child: ListView.separated(
                  itemCount: state.users.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(user.name.isNotEmpty ? user.name[0] : "?"),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Text(
                        user.role.name,
                        style: TextStyle(
                          color: user.role.name == "admin"
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return const Center(child: Text("Kullanıcılar yüklenmedi"));
          },
        ),
      ),
    );
  }
}
