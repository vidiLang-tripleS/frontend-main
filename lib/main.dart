import 'package:flutter/material.dart';
import 'package:vidilang/start.dart';
import 'theme.dart';
import 'header.dart';
import 'navbar.dart';
import 'package:intl/date_symbol_data_local.dart'; // 날짜 데이터 초기화 패키지

void main() {
  initializeDateFormatting(); // 날짜 데이터 초기화
  runApp(MyApp());
}

class VidiLang extends StatelessWidget {
  const VidiLang({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨기기
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Navbar(),
            Header(),
            Center(
              child: TestText(),
            ),
          ],
        ),
      ),
    );
  }
}
