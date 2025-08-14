import 'package:bus/app/core/constants/colors.dart';
import 'package:bus/app/core/extensions/color_helper.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "T.C. Kimlik No",
                  labelStyle: Theme.of(context).textTheme.titleLarge,
                  hintText: "11 haneli kimlik numarası",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  suffixIcon: const Icon(Icons.badge, color: NColors.secondary),
                  filled: true,
                  fillColor: Theme.of(context).fieldCustom,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Colors.indigo, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Şifre",
                  labelStyle: Theme.of(context).textTheme.titleLarge,
                  hintText: "Lütfen şifrenizi giriniz",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  suffixIcon: const Icon(Icons.password_sharp, color: NColors.secondary),
                  filled: true,
                  fillColor: Theme.of(context).fieldCustom,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Colors.indigo, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NColors.secondary,
                      foregroundColor: NColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                    child: const Text("Giriş Yap"),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
