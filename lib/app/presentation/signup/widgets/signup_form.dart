import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final phoneController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Hoşgeldin ${state.user.name}')),
            );
          } else if (state is AuthFailure) {
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
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: "İsim",
                    controller: firstNameController,
                    suffixIcon: Icon(Iconsax.user),
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                SizedBox(width: NSizes.spaceBtwInputFields),
                Expanded(
                  child: CustomTextFormField(
                    hintText: "Soyad",
                    controller: lastNameController,
                    suffixIcon: Icon(Iconsax.user),
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ],
            ),

            const SizedBox(height: NSizes.spaceBtwInputFields),

            CustomTextFormField(
              hintText: "E-mail",
              controller: emailController,
              suffixIcon: Icon(Iconsax.direct),
              prefixIcon: Icon(Iconsax.direct_right),
              validator: (value) => value != null && value.contains('@')
                  ? null
                  : 'Geçerli bir e-posta girin.',
            ),

            const SizedBox(height: NSizes.spaceBtwInputFields),

            CustomTextFormField(
              hintText: "Telefon Numarası",
              controller: phoneController,
              suffixIcon: Icon(Icons.phone),
              prefixIcon: Icon(Iconsax.direct_right),
            ),

            const SizedBox(height: NSizes.spaceBtwInputFields),

            CustomTextFormField(
              controller: passwordController,
              hintText: "Şifre",
              isObsecureText: true,
              suffixIcon: Icon(Icons.password),
              prefixIcon: Icon(Iconsax.direct_right),
              validator: (value) => value != null && value.length >= 6
                  ? null
                  : 'Şifre en az 6 karakter olmalı.',
            ),

            const SizedBox(height: NSizes.spaceBtwSections),
            CustomButton(
              text: "Hesap Oluştur",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                    SignUpEvent(
                      email: emailController.text,
                      password: passwordController.text,
                      name: firstNameController.text,
                      surname: lastNameController.text,
                      phone: phoneController.text,
                    ),
                  );
                }
                context.router.push(HomeRoute());
              },
              primaryColor: Colors.black,
              secondaryColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
