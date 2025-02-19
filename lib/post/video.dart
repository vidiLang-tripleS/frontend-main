import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 289.88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: 48,
              color: Color(0xFFD9D9D9),
              padding: EdgeInsets.only(left: 18),
              alignment: Alignment.centerLeft,
              child: Text(
                "기내 속 영어 회화",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  height: 1.57,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 48,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: 241.88,
              child: Image.asset(
                'assets/icons/video.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
