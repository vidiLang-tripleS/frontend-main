import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  TabBarWidget({required this.selectedIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 20,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabButton("트랜스크립션", 0),
              _buildTabButton("요약", 1),
              _buildTabButton("메모", 2),
              _buildTabButton("퀴즈", 3),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 1.73,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildUnderline(0),
              _buildUnderline(1),
              _buildUnderline(2),
              _buildUnderline(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        width: 80,
        height: 20,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildUnderline(int index) {
    bool isActive = selectedIndex == index;

    return Container(
      width: 80,
      height: 1.73,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFEB5757) : Color(0xFFEFF1F3),
      ),
    );
  }
}
