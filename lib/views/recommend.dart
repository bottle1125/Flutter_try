import 'dart:convert';
import 'package:flutter/material.dart';

class RecommendBox extends StatelessWidget {
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
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('load_json/recommend_data.json'),
              builder: (context, snapshot) {
                var recommendData = json.decode(snapshot.data.toString());

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendData.length,
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
                              child: Image(
                                image: NetworkImage(recommendData[index]['avatar']),
                                fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              recommendData[index]['nick'],
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
                );
              },
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