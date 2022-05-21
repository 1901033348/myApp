import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'completes/news_complete.dart';
import 'news_title.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<NewsComplete> _datas = <NewsComplete>[];

  Future<List<NewsComplete>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var responce = await get(Uri.parse(url));
    var data = <NewsComplete>[];
    if (responce.statusCode == 200) {
      var datasJson = json.decode(responce.body);
      for (var dataJson in datasJson) {
        data.add(NewsComplete.fromJson(dataJson));
      }
    }
    return data;
  }

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        _datas.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color1 = const Color(0xff231D49);
    const color2 = const Color(0xff221C44);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('News',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.15,
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        centerTitle: true,
        backgroundColor: color1,
      ),
      body: ListView.builder(
        itemCount: _datas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsTitle(newsComplete: _datas[index]),
              ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: color2,
              margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _datas[index].title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      _datas[index].body,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
