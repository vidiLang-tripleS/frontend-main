import 'package:flutter/material.dart';
import 'theme.dart';
import 'header.dart';
import 'navbar.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Header(),
          ],
        ),
        bottomNavigationBar: Navbar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
