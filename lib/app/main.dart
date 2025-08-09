import 'package:bus/app/core/core.dart';
import 'package:bus/app/presentation/navbar/bloc.dart';
import 'package:bus/app/presentation/navbar/view.dart'; // LandingPage burada olmalı
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode : ThemeMode.system,
      theme: NAppTheme.lightTheme,
      darkTheme: NAppTheme.darkTheme,
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: const LandingPage(),
      ),
    );
  }
}
