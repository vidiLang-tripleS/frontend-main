import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizList extends StatelessWidget {
  final List<Map<String, dynamic>> quizItems = [
    {"title": "퀴즈 1", "count": "10문제", "time": "3시간 전", "isCompleted": true},
    {"title": "퀴즈 2", "count": "10문제", "time": "5시간 전", "isCompleted": true},
    {"title": "퀴즈 3", "count": "10문제", "time": "1일 전", "isCompleted": true},
    {"title": "퀴즈 4", "count": "10문제", "time": "2일 전", "isCompleted": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: Container(
          height: 300,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: quizItems.length,
            itemBuilder: (context, index) {
              return Container(
                width: 410,
                height: 44.38,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9).withOpacity(0.9),
                  border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quizItems[index]["title"]!,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            quizItems[index]["count"]!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            quizItems[index]["time"]!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                          SizedBox(width: 10),
                          quizItems[index]["isCompleted"]
                              ? SvgPicture.asset(
                                  'assets/icons/check_icon.svg',
                                  width: 17.75,
                                  height: 17.75,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/x_icon.svg',
                                  width: 17.75,
                                  height: 17.75,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
