import 'package:bus/app/core/extensions/color_helper.dart';
import 'package:bus/app/presentation/login/views/widgets/login_form.dart';
import 'package:bus/app/presentation/login/views/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryCustom,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
            children: [
              LoginHeader(),
              const SizedBox(height: 16),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
