import 'package:flutter/material.dart';
import 'theme.dart';
import 'header.dart';
import 'navbar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨기기
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Header(),
            Center(
              child: TestText(),
            ),
          ],
        ),
        bottomNavigationBar: Navbar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
