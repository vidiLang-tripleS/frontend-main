import 'package:flutter/material.dart';
import 'navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
