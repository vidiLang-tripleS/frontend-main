import 'package:flutter/material.dart';
import 'common/navbar.dart';
import 'common/theme.dart';
import 'post/juice_list.dart';

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
              context: context,
              title: '영어',
              subtitle: '#English',
              color: AppColors.maincolor,
            ),
            _buildFolderCard(
              context: context,
              title: '스페인어',
              subtitle: '#Spanish',
              color: const Color(0xFFF2994A),
            ),
            _buildFolderCard(
              context: context,
              title: '일본어',
              subtitle: '#Japanese',
              color: const Color(0xFFFDB022),
            ),
            _buildFolderCard(
              context: context,
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
    required BuildContext context,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JuiceList()),
        );
      },
      child: Container(
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
  // 선택된 언어 태그와 색상
  String? _selectedLanguage;
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
      initialChildSize: 0.57,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
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
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    '폴더 생성',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // 폴더명 입력
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '폴더명',
                    hintText: '폴더명을 입력하세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 언어 태그 라벨
                const Text(
                  '언어 태그',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // 단일 선택 언어 태그 (FilterChip)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _languages
                      .map((lang) => _buildLanguageChip(lang))
                      .toList(),
                ),
                const SizedBox(height: 20),

                // 폴더 색상 라벨
                const Text(
                  '폴더 색상',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // 단일 선택 폴더 색상
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      _colors.map((color) => _buildColorCircle(color)).toList(),
                ),
                const SizedBox(height: 25),

                // 우측 정렬 버튼들
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

  // 단일 선택 언어 태그 (체크 아이콘 없이)
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
      showCheckmark: false,
      onSelected: (selected) {
        setState(() {
          _selectedLanguage = selected ? label : null;
        });
      },
    );
  }

  // 단일 선택 폴더 색상 (선택 시 체크 아이콘 포함)
  Widget _buildColorCircle(Color color) {
    final bool isSelected = (color == _selectedColor);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 16)
            : null,
      ),
    );
  }
}
