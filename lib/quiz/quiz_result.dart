import 'package:flutter/material.dart';

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
    double scorePercentage = (correctAnswers / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: Color(0xFFF7E6E6),
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pretendard',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '결과 확인',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pretendard',
              ),
            ),
            SizedBox(height: 30),

            // 원형 진행률 바
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    value: scorePercentage / 100,
                    backgroundColor: Colors.white,
                    color: Color(0xFFEB5757),
                    strokeWidth: 18,
                  ),
                ),
                Text(
                  '${scorePercentage.toInt()}%',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            SizedBox(height: 50),

            // 언어별 정답률 표시
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categoryScores.keys.map((category) {
                  double categoryProgress =
                      categoryScores[category]! / categoryTotal[category]!;
                  Color progressColor;

                  switch (category) {
                    case '영어':
                      progressColor = Colors.red;
                      break;
                    case '스페인어':
                      progressColor = Colors.orange;
                      break;
                    case '일본어':
                      progressColor = Colors.yellow;
                      break;
                    default:
                      progressColor = Colors.grey;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: progressColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${categoryScores[category]}/${categoryTotal[category]}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: categoryProgress,
                            backgroundColor: Colors.grey.shade300,
                            color: progressColor,
                            minHeight: 6,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 30),
            // 버튼들

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        '홈으로 돌아가기',
                        style: TextStyle(
                          fontSize: 24,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
