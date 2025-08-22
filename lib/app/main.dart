import 'package:bus/app/bloc_observer.dart';
import 'package:bus/app/services/cache/user_cache.dart';
import 'package:flutter/material.dart';
import 'package:bus/app/routes/app_router.dart';
import 'package:bus/app/core/core.dart';
import 'package:bus/app/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: NAppTheme.lightTheme,
      darkTheme: NAppTheme.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
