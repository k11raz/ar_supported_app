import 'package:bus/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Bloc.observer = const SimpleBlocObserver();
  runApp(
    MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: NAppTheme.lightTheme,
      darkTheme: NAppTheme.darkTheme,
      routerConfig: _appRouter.config(),
    ),
  );
}
