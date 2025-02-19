import 'package:flutter/material.dart';
import 'package:vidilang/auth/signup.dart';
import 'package:vidilang/navbar.dart';
import 'package:vidilang/post/juice_list.dart';
import 'package:vidilang/post/juice_transcription.dart';
import 'package:vidilang/post/search_list.dart';
import 'package:vidilang/theme.dart';
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
