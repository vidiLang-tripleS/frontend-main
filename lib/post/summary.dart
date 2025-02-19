import 'package:flutter/material.dart';
import 'package:vidilang/theme.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: Text(
          """
ASDFSADFAI는 쇼핑, 콘텐츠 추천, 의료 등 일상생활 여러 분야에서 이미 큰 영향을 미치고 있습니다.
Netflix와 Amazon 같은 플랫폼은 AI를 활용해 개인화된 서비스를 제공하고, 의료 분야에서는 질병 진단과 수술 지원에 AI를 활용하고 있습니다.
          """,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
