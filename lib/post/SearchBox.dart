import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Container(
          width: 382,
          height: 51,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(0xFFBEBEBE)),
          ),
          child: Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Color(0xFF4F4F4F),
                  ),
                  decoration: InputDecoration(
                    hintText: '검색',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 51,
                decoration: BoxDecoration(
                  color: Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/search_icon.svg",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
