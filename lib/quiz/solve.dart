import 'package:flutter/material.dart';
import 'result.dart';
import '../theme.dart';
import '../quiz/list_page.dart';

class QuizSolve extends StatefulWidget {
  @override
  _QuizSolveState createState() => _QuizSolveState();
}

class _QuizSolveState extends State<QuizSolve> {
  //예시 데이터
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'She is ______ on an important project right now.',
      'options': ['work', 'worked', 'working', 'will work'],
      'answer': 'working'
    },
    {
      'question': 'He ______ to the gym every morning.',
      'options': ['go', 'goes', 'going', 'gone'],
      'answer': 'goes'
    },
    {
      'question': 'They ______ a new car last week.',
      'options': ['buy', 'bought', 'buys', 'buying'],
      'answer': 'bought'
    },
  ];

  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  String? selectedAnswer;
  bool isAnswerChecked = false;

  // 사용자가 선택한 답안을 저장하는 리스트
  List<String?> selectedAnswers = List.filled(3, null);

  //예시 데이터 나중에는 백에서 받아와야함
  Map<String, int> categoryScores = {
    '영어': 5,
    '스페인어': 2,
    '일본어': 1,
  };
  Map<String, int> categoryTotal = {
    '영어': 5,
    '스페인어': 3,
    '일본어': 2,
  };

  double get progress => (currentQuestionIndex + 1) / questions.length;

  void toggleSelection(String option) {
    if (isAnswerChecked) return;
    setState(() {
      selectedAnswer = option;
    });
  }

  void checkAnswer() {
    setState(() {
      isAnswerChecked = true;
      selectedAnswers[currentQuestionIndex] = selectedAnswer; // 선택한 답안 저장
      if (selectedAnswer == questions[currentQuestionIndex]['answer']) {
        correctAnswers++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        isAnswerChecked = false;
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(
            correctAnswers: correctAnswers,
            totalQuestions: questions.length,
            categoryScores: categoryScores,
            categoryTotal: categoryTotal,
            selectedAnswers: selectedAnswers, // 선택한 답안 전달
          ),
        ),
      );
    }
  }

  //  정답/오답에 따라 버튼 색상 변경
  Color getButtonColor(String option) {
    if (!isAnswerChecked) {
      return selectedAnswer == option ? Color(0xFFE5E5E5) : Colors.transparent;
    } else {
      if (option == questions[currentQuestionIndex]['answer']) {
        return Colors.green;
      } else if (option == selectedAnswer) {
        return Colors.red;
      }
      return Colors.grey.shade200;
    }
  }

  // 정답/오답에 따라 텍스트 색상 변경
  Color getTextColor(String option) {
    if (!isAnswerChecked) return Colors.black;

    if (option == questions[currentQuestionIndex]['answer']) {
      return Colors.black; //일단 검정 추후 변경 가능
    } else if (option == selectedAnswer) {
      return Colors.black; //일단 검정 추후 변경 가능
    }
    return Colors.black;
  }

  // 아이콘 출력
  Widget getIcon(String option) {
    if (isAnswerChecked) {
      if (option == questions[currentQuestionIndex]['answer']) {
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.circle_outlined,
            color: Color(0xFFA0C97D),
            size: 25,
          ),
        );
      } else if (option == selectedAnswer) {
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.close,
            color: AppColors.maincolor,
            size: 25,
          ),
        );
      }
    } else if (!isAnswerChecked && option == selectedAnswer) {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.check,
          color: AppColors.black,
          size: 25,
        ),
      );
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65),
            //퀴즈 리스트 타이틀
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '퀴즈리스트',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pretendard',
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizListPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            //퀴즈 프로그래스 바
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${currentQuestionIndex + 1}/${questions.length}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                        minHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            //퀴즈 문제 텍스트
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${questions[currentQuestionIndex]['question']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 60),
            //퀴즈 문제 답안 버튼
            Column(
              children: questions[currentQuestionIndex]['options']
                  .map<Widget>((option) {
                return GestureDetector(
                  onTap: () => toggleSelection(option),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: getButtonColor(option),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.lightgray, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: TextStyle(
                            fontSize: 22,
                            color: getTextColor(option),
                          ),
                        ),
                        getIcon(option),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Spacer(),
            //퀴즈 다음 확인 버튼
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: isAnswerChecked
                    ? nextQuestion
                    : selectedAnswer != null
                        ? checkAnswer
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedAnswer != null
                      ? Color(0xFFEB5757)
                      : Color(0xFF828282),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isAnswerChecked ? '다음 문제' : '정답 확인',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
