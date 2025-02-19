import 'package:flutter/material.dart';
import 'package:vidilang/post/tab_list.dart';
import 'package:vidilang/common/theme.dart';
import 'package:vidilang/post/transcription.dart';
import 'package:vidilang/post/summary.dart';
import 'package:vidilang/post/memo.dart';
import 'package:vidilang/post/quiz_list.dart';
import 'package:vidilang/post/video.dart';
import 'package:vidilang/post/back_arrow.dart';

class JuiceTranscription extends StatefulWidget {
  @override
  _JuiceTranscriptionScreenState createState() =>
      _JuiceTranscriptionScreenState();
}

class _JuiceTranscriptionScreenState extends State<JuiceTranscription> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          BackArrow(folderName: "영어", folderColor: Colors.red),
          Positioned(
            top: 105,
            left: 0,
            child: Container(
              width: 430,
              height: 241.88,
              child: Video(),
            ),
          ),
          Positioned(
            top: 405,
            left: 0,
            right: 0,
            child: TabBarWidget(
              selectedIndex: _selectedIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          Positioned.fill(
            top: 430,
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Transcription(),
                Summary(),
                Memo(),
                QuizList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
