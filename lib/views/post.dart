import 'package:flutter/material.dart';
import 'dart:convert';

class PostBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('load_json/post_data.json'),
        builder: (context, snapshot) {
          var postData = json.decode(snapshot.data.toString());

          return ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: postData.length,
            shrinkWrap: true,
            // itemExtent: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 20,
                  right: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: Image(
                              image: NetworkImage(postData[index]['user']['avatar']),
                              fit: BoxFit.fill
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                postData[index]['user']['nick'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff2C2B2E)
                                )
                              ),
                              Text(
                                postData[index]['published_at'].toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xffA29FA3)
                                )
                              )
                            ],
                          ),
                        )
                        
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, left: 40),
                      child: Text(
                        postData[index]['words'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff2c2b2e)
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }
}