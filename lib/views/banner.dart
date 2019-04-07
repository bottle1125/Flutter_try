import 'dart:convert';
import 'package:flutter/material.dart';

class BannerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9),
      height: 112,
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('load_json/banner_data.json'),
        builder: (context, snapshot) {
          var bannerData = json.decode(snapshot.data.toString());

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerData.length,
            itemExtent: 335,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bannerData[index]['thumb']),
                    fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
              );
            },
          );
        }
      )
    );
  }
}