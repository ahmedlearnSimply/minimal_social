// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscure;
  final String labelText;
  Icon prefixIcon;
  TextEditingController controller;
  CustomTextFormField({
    required this.obscure, // If the field should obscure the input
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        prefixIcon: prefixIcon, // Icon at the start
        border: OutlineInputBorder(
          // Adds a border around the field
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners

          // Border when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners

          // Border when focused
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        fillColor: null, // Background color
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 16.0), // Padding inside the field
      ),
    );
  }
}
