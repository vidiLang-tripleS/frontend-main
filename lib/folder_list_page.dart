import 'package:flutter/material.dart';
import 'navbar.dart';
import 'theme.dart';

class FolderListPage extends StatelessWidget {
  const FolderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0), // 원하는 만큼 padding 조절
          child: const Text(
            '폴더 선택',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: 폴더 추가 기능
            },
            icon: const Icon(Icons.add),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: const Color(0xFFD9D9D9),
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.6,
          children: [
            _buildFolderCard(
              title: '영어',
              subtitle: '#English',
              color: AppColors.maincolor,
            ),
            _buildFolderCard(
              title: '스페인어',
              subtitle: '#Spanish',
              color: const Color(0xFFF2994A),
            ),
            _buildFolderCard(
              title: '일본어',
              subtitle: '#Japanese',
              color: const Color(0xFFFDB022),
            ),
            _buildFolderCard(
              title: '기본',
              subtitle: '#Uncategorized',
              color: const Color(0xFF808080),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(currentIndex: 1),
    );
  }

  Widget _buildFolderCard({
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // 오른쪽 상단 점 3개 아이콘
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              onPressed: () {
                // TODO: 편집/삭제 메뉴
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
          // 폴더 정보 (제목, 해시태그)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
