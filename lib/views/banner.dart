// import 'dart:convert';
import 'package:flutter/material.dart';

class BannerBox extends StatefulWidget {
  BannerBox({Key key, this.model}) : super(key: key);

  final List model;

  @override
  _BannerBox createState() => _BannerBox();
}
class _BannerBox extends State<BannerBox>  {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9),
      height: 112,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.model.length,
          itemExtent: 335,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.model[index]['recommend_thumb'] != null ? NetworkImage(widget.model[index]['recommend_thumb']) : Container(),
                  fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                )
              ),
            );
          },
        )
    );
  }
}