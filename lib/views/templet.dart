import 'package:flutter/material.dart';
import 'dart:math' as math;

class TempletBox extends StatefulWidget {
  TempletBox({ Key key, this.templets }) : super(key: key);
  final List templets;

  @override
  _TempletBox createState() => _TempletBox();
}

class _TempletBox extends State<TempletBox> {
  int num = 1;
  var templet = new Map();
  double imgWidth = 0;
  double imgHeight = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    templet = widget.templets[0]['data_info']['preview_info'];
    getImageSize(templet);

    if(widget.templets.length > 1) {
      num = widget.templets.length;
    }
  }

  void getImageSize(item) {
    double width = item['width'].toDouble();
    double height = item['height'].toDouble();
    double maxWidth = 283.toDouble();
    double maxHeight = 200.toDouble();
    double ratio = maxWidth / maxHeight;
    double realRatio = item['width'] / item['height'];
    if(realRatio > ratio) {
      width = math.min(maxWidth, width);
      height = width / realRatio;
    } else {
      height = math.min(maxHeight, height);
      width = height * realRatio;
    }

    setState(() {
      imgWidth = width;
      imgHeight = height;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: imgWidth,
      height: imgHeight,
      child: num == 1 ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: templet['url'] != null ? NetworkImage(templet['url']) : Container(),
            fit: BoxFit.fill
          )
        ),
      ) : Container()
    );
  }
}