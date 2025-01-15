// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:minimal_social/components/custom_button.dart';
import 'package:minimal_social/components/custom_text_form_field.dart';
import 'package:minimal_social/helper/helper_methods.dart';

class LoginPage extends StatefulWidget {
  final void Function() onTap;
  LoginPage({
    required this.onTap,
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //* login Method
  void login() async {
    //* Show Loading indicator
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    //* Try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

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
                    onTap: widget.onTap,
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
                onTap: login,
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
                    onTap: widget.onTap,
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
