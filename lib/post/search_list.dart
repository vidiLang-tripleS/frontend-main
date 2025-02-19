import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vidilang/post/juice_transcription.dart';

class SearchList extends StatelessWidget {
  // 검색 결과 리스트 (예시 데이터)
  final List<Map<String, String>> searchResults = [
    {
      "title": "초보자를 위한 영어 일상 회화",
      "channel": "Learn English with Emma",
      "thumbnail": "assets/icons/thumbnail.png",
    },
    {
      "title": "여행을 위한 기본 영어 회화",
      "channel": "Speak English With Vanessa",
      "thumbnail": "assets/icons/thumbnail.png",
    },
    {
      "title": "일상에서 자주 쓰는 영어 표현 100가지",
      "channel": "English Addict with Mr. Steve",
      "thumbnail": "assets/icons/thumbnail.png",
    },
    {
      "title": "영어를 유창하게 말하는 연습 방법",
      "channel": "English Fluency Journey",
      "thumbnail": "assets/icons/thumbnail.png",
    },
    {
      "title": "직장과 학업을 위한 실전 영어 회화",
      "channel": "BBC Learning English",
      "thumbnail": "assets/icons/thumbnail.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 5),
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return _buildSearchItem(context, searchResults[index]); // context 추가
        },
      ),
    );
  }

  Widget _buildSearchItem(
      BuildContext context, Map<String, String> searchData) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JuiceTranscription(),
          ),
        );
      },
      child: Container(
        width: 380,
        height: 81,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 0.9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    searchData["thumbnail"]!,
                    width: 130,
                    height: 73,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searchData["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3),
                      Text(
                        searchData["channel"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/option_icon.svg",
                    width: 18,
                    height: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
