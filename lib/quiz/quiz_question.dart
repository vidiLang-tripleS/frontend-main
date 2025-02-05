import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  // 보기 옵션들
  final List<String> options = ['work', 'worked', 'working', 'will work'];
  final String correctAnswer = 'working'; // 정답
  String? selectedAnswer; // 사용자가 선택한 답
  bool isAnswerChecked = false; // 정답 확인 여부

  // 버튼 색상 결정
  Color getButtonColor(String option) {
    if (option == selectedAnswer && !isAnswerChecked) {
      return Color(0xFFC0C0C0); // 선택된 답은 #C0C0C0 (회색)
    } else if (isAnswerChecked) {
      return option == correctAnswer
          ? Colors.green
          : (option == selectedAnswer ? Colors.red : Colors.grey.shade200);
    }
    return Colors.white; // 기본 색상은 흰색
  }

  // 텍스트 색상 결정
  Color getTextColor(String option) {
    if (isAnswerChecked) {
      if (option == selectedAnswer && option != correctAnswer) {
        return Colors.white;
      }
    }
    return Colors.black; // 기본 텍스트 색상
  }

  // 아이콘 결정 (Flutter 기본 아이콘 사용)
  Widget getIcon(String option) {
    if (isAnswerChecked) {
      if (option == correctAnswer) {
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // 아이콘 배경색
          ),
          child: Icon(
            Icons.circle_outlined, // 정답 아이콘
            color: Colors.green, // 아이콘 색상
            size: 25, // 아이콘 크기
          ),
        );
      } else if (option == selectedAnswer) {
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // 아이콘 배경색
          ),
          child: Icon(
            Icons.close, // 틀린 답 아이콘
            color: Colors.red, // 아이콘 색상
            size: 25, // 아이콘 크기
          ),
        );
      }
    } else if (!isAnswerChecked && option == selectedAnswer) {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // 아이콘 배경색
        ),
        child: Icon(
          Icons.check, // 선택된 답 아이콘
          color: Colors.grey, // 아이콘 색상
          size: 25, // 아이콘 크기
        ),
      );
    }
    return SizedBox.shrink(); // 아이콘을 출력하지 않음
  }

  // 정답 확인 버튼 활성화 여부
  bool get isSubmitButtonEnabled {
    return selectedAnswer != null; // 답을 선택하면 버튼 활성화
  }

  // 답안 선택 또는 취소 처리
  void toggleSelection(String option) {
    if (isAnswerChecked) return; // 정답 확인 후 선택 또는 수정할 수 없음

    setState(() {
      if (selectedAnswer == option) {
        selectedAnswer = null; // 이미 선택된 답을 다시 클릭하면 취소
      } else {
        selectedAnswer = option; // 선택한 답 저장
      }
    });
  }

  // "다음 문제" 버튼 클릭 시 처리
  void nextQuestion() {
    setState(() {
      isAnswerChecked = false; // 정답 확인 초기화
      selectedAnswer = null; // 선택된 답 초기화
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7E6E6), // 배경 색상
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            // Quiz 제목 출력 (AppBar 외부에서 큰 글씨로 출력)
            Center(
              child: Text(
                'Quiz',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Pretendard',
                ),
              ),
            ),
            SizedBox(height: 40), // 문제 문구 위치 내리기

            // 문제 문구에 배경 추가 (문제를 좀 더 아래로 내리기)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white, // 배경 색상 (하얀색)
                borderRadius: BorderRadius.circular(8), // 둥근 모서리
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // 그림자 효과
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // 그림자 위치
                  ),
                ],
              ),
              child: Text(
                'Choose the correct verb form for this sentence:\n\nShe is ______ on an important project right now.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left, // 텍스트 좌측 정렬
              ),
            ),
            SizedBox(height: 60), // 문제와 보기 버튼 사이에 간격 추가

            // 보기 버튼들
            Column(
              children: options.map((option) {
                return GestureDetector(
                  onTap: () => toggleSelection(option), // 선택 또는 취소 처리
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20), // 간격 추가
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20), // 버튼 높이 조정
                    width: double.infinity, // 버튼을 화면 가득 차게 만듬
                    decoration: BoxDecoration(
                      color: getButtonColor(option), // 버튼 색상 결정
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 텍스트 좌측 정렬
                        Text(
                          option,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: getTextColor(option),
                          ),
                        ),
                        // 아이콘 표시
                        getIcon(option), // 아이콘 표시
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20), // 보기 버튼과 정답 확인 버튼 사이의 간격을 조금 줄여서 올리기

            // 정답 확인 버튼 또는 다음 문제 버튼
            Container(
              width: double.infinity, // 버튼을 화면 가득 차게
              height: 60, // 버튼 높이를 설정하여 다른 버튼과 크기 맞추기
              child: ElevatedButton(
                onPressed: isAnswerChecked
                    ? nextQuestion // 정답을 확인 후 '다음 문제' 버튼 클릭 시
                    : isSubmitButtonEnabled
                        ? () {
                            setState(() {
                              isAnswerChecked = true; // 정답 확인
                            });
                          }
                        : null, // 버튼이 활성화되지 않으면 비활성화
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSubmitButtonEnabled
                      ? Color(0xFFEB5757) // '정답 확인' 버튼 색상 (빨간색)
                      : Color(0xFF828282), // 비활성화된 버튼 색상
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pretendard',
                  ),
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
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
