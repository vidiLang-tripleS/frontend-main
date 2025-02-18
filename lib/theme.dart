import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppColors {
  static const Color primary = Color(0xFFFFFFFF); // 네비바
  static const Color background = Color(0xFFF9F9F9); // 배경
  static const Color icon = Color(0x33363F); //아이콘
  static const Color font = Color(0xFF4F4F4F); //텍스트
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.67,
      height: 188,
      child: Image.asset(
        'assets/icons/image.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class font {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Pretendard',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    ),
  );
}

class TestText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '프리텐다드 Pretendard',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w900), // Black (가장 두꺼운)
        ),
        Text(
          '프리텐다드 Pretendard',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700), // Bold
        ),
        Text(
          '프리텐다드 Pretendard',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w500), // Medium
        ),
      ],
    );
  }
}
