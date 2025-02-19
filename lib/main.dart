import 'package:flutter/material.dart';
import 'package:vidilang/auth/login.dart';

void main() {
  // 날짜 데이터 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨기기
      home: Login(),
    );
  }
}
