// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_social/pages/login_page.dart';
import 'package:minimal_social/pages/register_page.dart';
import 'package:minimal_social/theme/dark.dart';
import 'package:minimal_social/theme/light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
