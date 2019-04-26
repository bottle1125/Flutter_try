import 'package:flutter/material.dart';

class PostBox extends StatefulWidget {
  PostBox({ Key key, this.model }) : super(key: key);
  final List model;

  @override
  _PostBox createState() => _PostBox();
}
class _PostBox extends State<PostBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.model.length,
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
                            child: widget.model[index]['user']['avatar'] != null ? Image(
                              image: NetworkImage(widget.model[index]['user']['avatar']),
                              fit: BoxFit.fill
                            ) : Container(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.model[index]['user']['nick'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff2C2B2E)
                                )
                              ),
                              Text(
                                widget.model[index]['published_at'].toString(),
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
                        widget.model[index]['words'],
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
          )
    );
  }
}