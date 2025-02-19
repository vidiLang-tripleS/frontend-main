import 'package:flutter/material.dart';
import 'common/navbar.dart';
import 'common/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [],
        ),
        bottomNavigationBar: Navbar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
