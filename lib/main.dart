import 'package:flutter/material.dart';
import 'theme.dart';
import 'navbar.dart';

void main() {
  runApp(MyApp());
}

class VidiLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨기기
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Navbar(),
            HeaderLogo(),
            Center(
              child: TestText(),
            ),
          ],
        ),
      ),
    );
  }
}
