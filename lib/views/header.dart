import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xffeeeeee))
        )
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '社交电商场景',
            style:TextStyle(
              fontSize: 22,
              color:Color(0xff2C2B2E),
              fontWeight: FontWeight.w700
            )
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 53,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(17)
                  ),
                  border: new Border.all(width: 1.0, color: Color(0xffdddddd)),
                ),
              ),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(width: 2.0, color: Color(0xff191919))
                ),
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff191919)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}