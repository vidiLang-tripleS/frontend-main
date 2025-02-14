import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../header.dart'; // Header 위젯 import
import '../navbar.dart';

class QuizListPage extends StatefulWidget {
  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  DateTime selectedDate = DateTime.now();
  PageController _pageController = PageController(initialPage: 100); // 중앙에서 시작

  // 가짜 데이터
  Map<DateTime, List<Map<String, dynamic>>> quizData = {
    DateTime(2025, 2, 4): [
      {
        'title': '영어',
        'hashtag': '#English',
        'count': 5,
        'color': Color(0xFFEB5757)
      },
      {
        'title': '스페인어',
        'hashtag': '#Spanish',
        'count': 3,
        'color': Color(0xFFF59E0B)
      },
      {
        'title': '일본어',
        'hashtag': '#Japanese',
        'count': 2,
        'color': Color(0xFFF2C94C)
      },
      {
        'title': '기본',
        'hashtag': '#Uncategorized',
        'count': 0,
        'color': Color(0xFF808080)
      },
    ],
    DateTime(2025, 2, 7): [
      {
        'title': '스페인어',
        'hashtag': '#Spanish',
        'count': 3,
        'color': Color(0xFFF59E0B)
      },
      {
        'title': '일본어',
        'hashtag': '#Japanese',
        'count': 2,
        'color': Color(0xFFF2C94C)
      },
      {
        'title': '기본',
        'hashtag': '#Uncategorized',
        'count': 0,
        'color': Color(0xFF808080)
      },
    ],
    DateTime(2025, 2, 10): [
      {
        'title': '일본어',
        'hashtag': '#Japanese',
        'count': 2,
        'color': Color(0xFFF2C94C)
      },
      {
        'title': '기본',
        'hashtag': '#Uncategorized',
        'count': 0,
        'color': Color(0xFF808080)
      },
    ],
  };

  void _onPageChanged(int index) {
    setState(() {
      // 현재 선택된 날짜의 일(day)을 기준으로 새로운 주의 동일한 날짜를 선택
      int currentDay = selectedDate.day;
      DateTime newBaseDate =
          DateTime.now().add(Duration(days: (index - 100) * 7));
      selectedDate = DateTime(newBaseDate.year, newBaseDate.month, currentDay);
    });
  }

  List<DateTime> _getWeekDates(DateTime baseDate) {
    int weekStartOffset = baseDate.weekday - 1;
    DateTime startOfWeek = baseDate.subtract(Duration(days: weekStartOffset));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  bool _hasQuizData(DateTime date) {
    return quizData.keys.any((key) =>
        key.year == date.year &&
        key.month == date.month &&
        key.day == date.day);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double headerHeight = statusBarHeight + 50; // Header 높이 설정

    return Scaffold(
      backgroundColor: Color(0xFFF7E6E6),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: headerHeight + 10), // Header 공간 확보
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.redAccent,
                child: Column(
                  children: [
                    Text(
                      '${selectedDate.year}년 ${selectedDate.month}월',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 80,
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: _onPageChanged,
                        itemBuilder: (context, index) {
                          List<DateTime> weekDates = _getWeekDates(
                              DateTime.now()
                                  .add(Duration(days: (index - 100) * 7)));

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: weekDates.map((date) {
                              bool isSelected = date.day == selectedDate.day &&
                                  date.month == selectedDate.month &&
                                  date.year == selectedDate.year;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat.E('ko_KR').format(date),
                                        style: TextStyle(
                                            color: isSelected
                                                ? Colors.redAccent
                                                : Colors.white70,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '${date.day}',
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.redAccent
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: _hasQuizData(selectedDate)
                      ? ListView(
                          children: (quizData[selectedDate] ?? []).map((quiz) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: quiz['color'],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        quiz['title'],
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        quiz['hashtag'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${quiz['count']}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('생성된 퀴즈가 없습니다',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Image.asset('assets/icons/tomato_quiz.png',
                                width: 200),
                          ],
                        ),
                ),
              ),
            ],
          ),
          Header(),
          Navbar(),
        ],
      ),
    );
  }
}
