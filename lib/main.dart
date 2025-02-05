import 'package:flutter/material.dart';
import 'package:vidilang/auth/signup.dart';
import 'package:vidilang/theme.dart';
import 'package:vidilang/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: font.lightTheme,
      home: Login(),
    );
  }
}
