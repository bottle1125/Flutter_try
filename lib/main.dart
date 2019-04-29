import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import './views/header.dart';
import './views/search.dart';
import './views/banner.dart';
import './views/recommend.dart';
import './views/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List bannerList = new List();
  List recommendList = new List();
  List postList = new List();

  Future getBannerData() async {
    var responseBody;
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(
      Uri.parse("http://api1.dev.ttxsapp.com/v2/articles/recommended")
    );

    var response = await request.close();

    if(response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      setState(() {
        bannerList = json.decode(responseBody);
      });
    }
  }

  Future getRecommendData() async {
    var responseBody;
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(
      Uri.parse("http://api2.dev.ttxsapp.com/v2/teams/official/users")
    );

    var response = await request.close();
    if(response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      var datas = json.decode(responseBody);
      var lists = new List();

      void addList(Map item) {
        lists.addAll(item['list']);
      }

      datas.forEach((item) => addList(item));

      setState(() {
        recommendList = lists;
      });
    }
  }

  Future getPostData() async {
    var responseBody;
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(
      Uri.parse("http://api1.dev.ttxsapp.com/v2/teams/official/posts?exclude_label_value=2")
    );

    var response = await request.close();

    if(response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      setState(() {
        postList = json.decode(responseBody);
      });
    }
  }
  
  Future<Null> _handleRefresh() async {
    return Future.wait([
      getBannerData(),
      getRecommendData(),
      getPostData()
    ]).then((_) {
      return null;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBannerData();
    getRecommendData();
    getPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _handleRefresh(),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                Header(),
                SearchBox(),
                new Flexible(
                  child: CustomScrollView(
                    reverse: false,
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          BannerBox(model: bannerList),
                          RecommendBox(model: recommendList),
                          PostBox(model: postList)
                        ]),
                      )
                    ],
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }
}
