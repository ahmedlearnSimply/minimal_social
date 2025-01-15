// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social/auth/auth.dart';
import 'package:minimal_social/pages/HomePage.dart';
import 'package:minimal_social/pages/profile_page.dart';
import 'package:minimal_social/pages/register_page.dart';
import 'package:minimal_social/pages/user_page.dart';
import 'package:minimal_social/theme/dark.dart';
import 'package:minimal_social/theme/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/auth': (context) => AuthPage(),
        '/profile': (context) => ProfilePage(),
        '/homepage': (context) => HomePage(),
        '/users': (context) => UserPage(),
      },
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
