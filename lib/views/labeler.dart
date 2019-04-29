import 'package:flutter/material.dart';

class Labeler extends StatefulWidget {
  Labeler({ Key key, this.text }) : super(key: key);
  final String text;

  @override
  _Labeler createState() => _Labeler();
}

class _Labeler extends State<Labeler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 15,
          color: Color(0xff2c2b2e)
        ),
      ),
    );
  }
}