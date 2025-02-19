import 'package:flutter/material.dart';
import 'theme.dart';
import 'quiz/list_page.dart'; // ✅ QuizListPage를 불러오기
import './folder_list_page.dart'; // ✅ FolderListPage를 불러오기
import 'add_juice.dart'; // ✅ HomePage를 불러오기
import 'start.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;

  Navbar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 네비게이션 바 배경
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFEFF1F3))),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),

        // 네비게이션 아이콘들
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home_outlined, 0, context, StartPage()), // 홈
              _buildNavItem(Icons.folder_open_outlined, 1, context,
                  FolderListPage()), // 폴더
              SizedBox(width: 60), // 중앙 버튼 공간 확보
              _buildNavItem(
                  Icons.lightbulb_outlined, 2, context, QuizListPage()), // 퀴즈
              _buildNavItem(
                  Icons.person_outline, 3, context, null), // 유저 (클릭 이벤트 없음)
            ],
          ),
        ),

        // 중앙 + 버튼
        Positioned(
          bottom: 30,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AddJuice()), // 퀴즈 페이지로 이동
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.maincolor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(Icons.add, size: 40, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(
      IconData icon, int index, BuildContext context, Widget? page) {
    return IconButton(
      icon: Icon(
        icon,
        size: 34,
        color: currentIndex == index
            ? AppColors.maincolor
            : Colors.black54, // 선택된 아이콘 색상 변경
      ),
      onPressed: page != null
          ? () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => page), // 화면 이동
              );
            }
          : null,
    );
  }
}
