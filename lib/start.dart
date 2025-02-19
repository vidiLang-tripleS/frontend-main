import 'package:flutter/material.dart';
import 'theme.dart';
import 'navbar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Navbar(),
            Center(
              child: TestText(),
            ),
          ],
        ),
      ),
    );
  }
}
