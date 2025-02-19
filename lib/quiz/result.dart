import 'package:flutter/material.dart';
import 'solve.dart';

class QuizResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final Map<String, int> categoryScores;
  final Map<String, int> categoryTotal;
  final List<String?> selectedAnswers;

  QuizResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.categoryScores,
    required this.categoryTotal,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(), // 상단 여백 확보

          // 퀴즈 결과 타이틀
          Text(
            '퀴즈 결과',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),

          // 점수 결과 컨테이너
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 80),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFEB5757),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  '점수',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '$correctAnswers / $totalQuestions',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),

          // 전체 문제 다시 풀기 & 틀린 문제 다시 풀기 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xFFBEBEBE)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        // 전체 문제 다시 풀기 기능
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSolve(), // 새 퀴즈 시작
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '전체문제\n다시풀기',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xFFBEBEBE)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        // TODO: 틀린 문제 다시 풀기 (나중에 구현)
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '틀린문제\n다시풀기',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 80),

          // 목록으로 돌아가기 버튼 (항상 하단에 고정)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEB5757),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  '목록으로 돌아가기',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
