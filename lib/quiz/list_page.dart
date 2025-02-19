import 'package:flutter/material.dart';
import '../common/navbar.dart';
import '../common/theme.dart';
import './solve.dart';

class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  // 🔥 드래그할 리스트 데이터
  List<Map<String, dynamic>> quizSets = [
    {
      'color': Colors.red,
      'title': 'A set',
      'score': '7/10',
      'time': '3시간 전',
      'isCompleted': true
    },
    {
      'color': Colors.green,
      'title': 'B set',
      'score': '7/10',
      'time': '3시간 전',
      'isCompleted': true
    },
    {
      'color': Colors.grey,
      'title': 'C set',
      'score': '7/10',
      'time': '3시간 전',
      'isCompleted': true
    },
    {
      'color': Colors.purple,
      'title': 'D set',
      'score': '-',
      'time': '-',
      'isCompleted': false
    },
  ];

  // 🔄 리스트 순서를 변경하는 함수
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = quizSets.removeAt(oldIndex);
      quizSets.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          '퀴즈 리스트',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          // 필터 버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildFilterButton('폴더명'),
                _buildFilterButton('문제 상태'),
                _buildFilterButton('문제 푼 날짜'),
              ],
            ),
          ),
          // 🔥 순서 변경이 가능한 리스트
          Expanded(
            child: ReorderableListView(
              onReorder: _onReorder,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: List.generate(
                quizSets.length,
                (index) => QuizItem(
                  key: ValueKey(quizSets[index]['title']), // 고유 Key 필수!
                  color: quizSets[index]['color'],
                  title: quizSets[index]['title'],
                  score: quizSets[index]['score'],
                  time: quizSets[index]['time'],
                  isCompleted: quizSets[index]['isCompleted'],
                ),
              ),
            ),
          ),
          Navbar(currentIndex: 2),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.maincolor,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Text(text),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class QuizItem extends StatelessWidget {
  final Color color;
  final String title;
  final String score;
  final String time;
  final bool isCompleted;

  const QuizItem({
    super.key,
    required this.color,
    required this.title,
    required this.score,
    required this.time,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizSolve(), // 🔥 solve.dart로 이동
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: color, radius: 8),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            if (isCompleted)
              const Icon(Icons.check, color: Colors.green)
            else
              const Icon(Icons.close, color: Colors.red),
            const SizedBox(width: 8),
            SizedBox(
              width: 40,
              child: Text(
                score,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 60,
              child: Text(
                time,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.menu, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
