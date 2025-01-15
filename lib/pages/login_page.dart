// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:minimal_social/components/custom_button.dart';
import 'package:minimal_social/components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final void Function() onTap;
  LoginPage({
    required this.onTap,
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //*logo
              Icon(
                Icons.person,
                size: 100,
              ), //*app Name
              Text(
                "M I N A M A L",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Gap(50),

              //* email text field
              CustomTextFormField(
                obscure: false,
                controller: emailController,
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
              ),
              Gap(10),
              //* password text field
              CustomTextFormField(
                obscure: true,
                controller: passwordController,
                prefixIcon: Icon(Icons.password),
                labelText: "password",
              ),

              Gap(10),
              //* Forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
              Gap(20),
              //* login button
              CustomButton(
                onTap: onTap,
                text: "Login",
              ),
              Gap(15),
              //* Don't have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Gap(5),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
