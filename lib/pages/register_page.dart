// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:minimal_social/components/custom_button.dart';
import 'package:minimal_social/components/custom_text_form_field.dart';
import 'package:minimal_social/helper/helper_methods.dart';

class RegisterPage extends StatefulWidget {
  final void Function() onTap;

  RegisterPage({
    required this.onTap,
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmedPWController = TextEditingController();

  //* register method
  void registerUser() async {
    //* show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    //* make sure password is match
    if (passwordController.text != comfirmedPWController.text) {
      //* pop loading indicator
      Navigator.pop(context);

      //* show error message
      displayMessageToUser("Password is not match", context);
    } else {
      //* try creating the user
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //* pop loading indicator
        Navigator.pop(context);

        //* show error message
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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

                //* username text field
                CustomTextFormField(
                  obscure: false,
                  controller: usernameController,
                  prefixIcon: Icon(Icons.person),
                  labelText: "username",
                ),
                Gap(10),
                //* email text field
                CustomTextFormField(
                  obscure: false,
                  controller: emailController,
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                ),
                Gap(10),
                //* email text field
                CustomTextFormField(
                  obscure: true,
                  controller: passwordController,
                  prefixIcon: Icon(Icons.password),
                  labelText: "password",
                ),
                Gap(10),
                //* password text field
                CustomTextFormField(
                  obscure: true,
                  controller: comfirmedPWController,
                  prefixIcon: Icon(Icons.password),
                  labelText: "confirm password",
                ),

                Gap(10),
                //* Forget password

                Gap(20),
                //* login button
                CustomButton(
                  onTap: registerUser,
                  text: "Register",
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Gap(5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Here",
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
      ),
    );
  }
}
