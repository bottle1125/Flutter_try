import 'package:flutter/material.dart';

class RecommendBox extends StatefulWidget {
  RecommendBox({Key key, this.model}) : super(key: key);

  final List model;

  @override
  _RecommendBox createState() => _RecommendBox();
}
class _RecommendBox extends State<RecommendBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 16, left: 16),
            child: Text(
              '热门推荐',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff333333),
                fontWeight: FontWeight.w500
              )
            )
          ),
          Container(
            height: 90,
            child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model.length,
                  itemExtent: 82,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: <Widget>[
                          ClipOval(
                            child: SizedBox(
                              width: 52,
                              height: 52,
                              child: widget.model[index]['avatar'] != null ? Image(
                                image:  NetworkImage(widget.model[index]['avatar']),
                                fit: BoxFit.fill
                              ) : Container(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              widget.model[index]['nick'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff333333),
                              )
                            )
                          )
                        ],
                      )
                    );
                  }
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            width: 375,
            height: 1,
            color: Color(0xffeeeeee)
          )
        ]
      )
      
    );
  }
}