import 'package:auto_route/auto_route.dart';
import 'package:bus/app/presentation/profile/bloc.dart';
import 'package:bus/app/presentation/profile/event.dart';
import 'package:bus/app/presentation/profile/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../app.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocListener<LoginBloc,LoginState>(
     listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.of(context).pop();
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Başarıyla giriş yapıldı ${state.user.name}')),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: "Kullanıcı adı veya Mail",
              prefixIcon: Icon(Iconsax.direct_right),
              suffixIcon: Icon(Iconsax.user),
              validator: (value) => value != null && value.contains('@')
                  ? null
                  : 'Geçerli bir e-posta girin.',
            ),
      
            const SizedBox(height: NSizes.spaceBtwInputFields),
      
            CustomTextFormField(
              controller: passwordController,
              onChanged: (value) {},
              hintText: "Şifre",
              prefixIcon: Icon(Iconsax.direct_right),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.eye_slash),
              ),
              validator: (value) => value != null && value.length >= 6
                  ? null
                  : 'Şifre en az 6 karakter olmalı.',
            ),
      
            const SizedBox(height: 32),
      
            CustomButton(
              text: "GİRİŞ YAP",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(
                    SignInEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
              primaryColor: Colors.black,
              secondaryColor: Colors.black,
            ),
          ],
        )
      ),
    );
  }
}