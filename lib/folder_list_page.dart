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
              showCreateFolderBottomSheet(context);
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

void showCreateFolderBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return const _CreateFolderBottomSheet();
    },
  );
}

class _CreateFolderBottomSheet extends StatefulWidget {
  const _CreateFolderBottomSheet({Key? key}) : super(key: key);

  @override
  State<_CreateFolderBottomSheet> createState() =>
      _CreateFolderBottomSheetState();
}

class _CreateFolderBottomSheetState extends State<_CreateFolderBottomSheet> {
  // 선택된 언어 태그
  String? _selectedLanguage;
  // 선택된 색상
  Color? _selectedColor;

  final List<String> _languages = [
    'English',
    'Chinese',
    'Persian',
    'Deutsch',
    'Spanish',
    'Japanese',
    'Russian',
    'French',
  ];

  final List<Color> _colors = [
    const Color(0xFFEB5757),
    const Color(0xFFF2994A),
    const Color(0xFFFDB022),
    const Color(0xFF34C759),
    const Color(0xFF2D9CDB),
    const Color(0xFF9B51E0),
    const Color(0xFFFF9E9E),
    const Color(0xFF808080),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            // 키보드가 올라올 때 하단 영역이 가려지지 않도록
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단 제목
                Center(
                  child: Text(
                    '폴더 생성',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 폴더명 입력
                TextField(
                  decoration: InputDecoration(
                    labelText: '폴더명',
                    hintText: '폴더명을 입력하세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 이미 존재하는 폴더 경고 예시 (필요 시 조건부로)
                // Text(
                //   '이미 존재하는 폴더입니다.',
                //   style: TextStyle(fontSize: 12, color: Colors.red),
                // ),
                // const SizedBox(height: 16),

                // 언어 태그 라벨
                const Text(
                  '언어 태그',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // 언어 태그(ChoiceChip 등으로 단일 선택)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _languages
                      .map((lang) => _buildLanguageChip(lang))
                      .toList(),
                ),
                const SizedBox(height: 16),

                // 폴더 색상 라벨
                const Text(
                  '폴더 색상',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // 색상 선택 (단일 선택)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      _colors.map((color) => _buildColorCircle(color)).toList(),
                ),
                const SizedBox(height: 20),

                // 하단 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFBEBEBE)),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text('취소'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.maincolor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text('수정'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 단일 선택 언어 태그 (ChoiceChip 활용)
  Widget _buildLanguageChip(String label) {
    final bool isSelected = (label == _selectedLanguage);
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      selectedColor: AppColors.maincolor,
      backgroundColor: Colors.grey.shade200,
      showCheckmark: false, // 체크 아이콘 비활성화
      onSelected: (selected) {
        setState(() {
          _selectedLanguage = selected ? label : null;
        });
      },
    );
  }

  // 단일 선택 색상 (GestureDetector + 체크 아이콘)
  Widget _buildColorCircle(Color color) {
    final bool isSelected = (color == _selectedColor);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        // 선택된 경우 안에 체크 아이콘 표시
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 16)
            : null,
      ),
    );
  }
}
