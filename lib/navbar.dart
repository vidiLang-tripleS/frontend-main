import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme.dart';
import 'quiz/list_page.dart';
import 'start.dart';
import 'folder_list_page.dart';
import 'quiz/solve.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 네비게이션 바
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 430,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.primary,
              border: Border.all(color: Color(0xFFEFF1F3)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
          ),
        ),

        // 홈 아이콘
        Positioned(
          left: MediaQuery.of(context).size.width * 0.0798,
          bottom: 32.86,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Container(
              child: SvgPicture.asset(
                'assets/icons/home_icon.svg',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),

        // 폴더 아이콘
        Positioned(
          left: MediaQuery.of(context).size.width * 0.2471,
          bottom: 32.86,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FolderListPage()),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/folder_icon.svg',
              width: 30,
              height: 30,
            ),
          ),
        ),

        // 더하기 버튼
        Positioned(
          left: MediaQuery.of(context).size.width * 0.5 - 46 / 2,
          bottom: 18.33,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizSolve()),
              );
              // 문제 보러가는 창으로 해뒀는데 수정해야함
            },
            child: SvgPicture.asset(
              'assets/icons/add_icon.svg',
              width: 48,
              height: 47,
            ),
          ),
        ),

        // 학사모 아이콘
        Positioned(
          left: MediaQuery.of(context).size.width * 0.6616,
          bottom: 32.86,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizListPage()),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/cap_icon.svg',
              width: 30,
              height: 30,
            ),
          ),
        ),

        // 유저 아이콘
        Positioned(
          left: MediaQuery.of(context).size.width * 0.8289,
          bottom: 32.86,
          child: GestureDetector(
            onTap: () {
              // 유저 아이콘 클릭 이벤트 처리
            },
            child: SvgPicture.asset(
              'assets/icons/user_icon.svg',
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
