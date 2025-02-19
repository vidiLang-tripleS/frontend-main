import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackArrow extends StatelessWidget {
  final String folderName;
  final Color folderColor;

  BackArrow({this.folderName = "영어", this.folderColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 65,
      left: 24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              "assets/icons/arrow_icon.svg",
              width: 24,
              height: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: folderColor,
            ),
          ),
          SizedBox(width: 6),
          Text(
            folderName,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
