import 'package:flutter/material.dart';
import './labeler.dart';
import './templet.dart';
class PostBox extends StatefulWidget {
  PostBox({ Key key, this.model }) : super(key: key);
  final List model;

  @override
  _PostBox createState() => _PostBox();
}
class _PostBox extends State<PostBox> {
  String getTime(int timestamp) {
    String result = '';

    DateTime now = DateTime.now(); 
    DateTime timer = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    var diff = now.difference(timer);

    if(diff.inDays > 7) {
      result = timer.month.toString() + '-' + timer.day.toString() + ' ' + timer.hour.toString() + ':' + timer.minute.toString();;
    } else if(diff.inDays > 2) {
      result = diff.inDays.toString() + '天前';
    } else if(diff.inDays >= 1) {
      result = '昨天';
    } else if(diff.inHours >= 1) {
      result = diff.inHours.toString() + '小时前';
    } else if(diff.inMinutes >= 1) {
      result = diff.inMinutes.toString() + '分钟前';
    } else {
      result = '刚刚';
    }

    return result;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.model.length,
            shrinkWrap: true,
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
                                getTime(widget.model[index]['published_at']),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Labeler(text: widget.model[index]['words']),
                          widget.model[index]['type'] == 3 ? TempletBox(templets: widget.model[index]['refs']) : Container()
                        ],
                      )
                    )
                  ],
                ),
              );
            },
          )
    );
  }
}