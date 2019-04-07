import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 11.0,
        horizontal: 16.0
      ),
      child: TextField(
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: '搜索动态内容',
          hintStyle: TextStyle(
            color: Color(0xffA6A6A6)
          ),
          fillColor: Color(0xffF0F0F2),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Color(0xfff0f0f2)
            )
          ),
          focusedBorder: InputBorder.none
        ),
      ),
    );
  }
}