import 'package:flutter/material.dart';
import 'package:vidilang/common/theme.dart';
import 'package:vidilang/post/SearchBox.dart';
import 'package:vidilang/post/back_arrow.dart';
import 'package:vidilang/post/search_list.dart';

class JuiceList extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<JuiceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 65,
            left: 24,
            child: BackArrow(),
          ),
          Positioned(
            top: 105,
            left: MediaQuery.of(context).size.width / 2 - 191,
            child: SearchBox(),
          ),
          Positioned(
            top: 165,
            left: 0,
            right: 0,
            bottom: 0,
            child: SearchList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            //child: Navbar(currentIndex: 2),
          ),
        ],
      ),
    );
  }
}
