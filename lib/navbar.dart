import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme.dart';

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
            height: 114,
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
          left: 34,
          bottom: 42.86,
          child: GestureDetector(
            onTap: () {
              // 홈 아이콘 클릭 이벤트 처리
            },
            child: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              width: 39.25,
              height: 39.25,
            ),
          ),
        ),

        // 폴더 아이콘
        Positioned(
          left: 106,
          bottom: 42.86,
          child: GestureDetector(
            onTap: () {
              // 폴더 아이콘 클릭 이벤트 처리
            },
            child: SvgPicture.asset(
              'assets/icons/folder_icon.svg',
              width: 39.25,
              height: 39.25,
            ),
          ),
        ),

        // 더하기 버튼
        Positioned(
          left: 191,
          bottom: 28.33,
          child: GestureDetector(
            onTap: () {
              // 더하기 버튼 클릭 이벤트 처리
            },
            child: SvgPicture.asset(
              'assets/icons/add_icon.svg',
              width: 56,
              height: 56,
            ),
          ),
        ),

        // 전구 아이콘
        Positioned(
          left: 284,
          bottom: 42.86,
          child: GestureDetector(
            onTap: () {
              // 전구 아이콘 클릭 이벤트 처리
            },
            child: SvgPicture.asset(
              'assets/icons/light_icon.svg',
              width: 39.25,
              height: 39.25,
            ),
          ),
        ),

        Positioned(
          left: 357,
          bottom: 42.86,
          child: GestureDetector(
            onTap: () {
              // 유저 아이콘 클릭 이벤트 처리
            },
            child: SvgPicture.asset(
              'assets/icons/user_icon.svg',
              width: 39.25,
              height: 39.25,
            ),
          ),
        ),
      ],
    );
  }
}
