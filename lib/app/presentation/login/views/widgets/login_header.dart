import 'package:bus/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Center(
        //   child: Image.asset(
        //     "assets/images/logo.png",
        //     height: 104,
        //   ),
        // ),
        // Center(
        //   child: Image.asset(
        //     "assets/images/logo1.png",
        //     height: 104,
        //   ),
        // ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            "Envanter Yönetim Sistemi",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: NColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
