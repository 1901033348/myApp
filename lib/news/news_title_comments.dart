import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'completes/news_complete.dart';
import 'completes/news_title_complete.dart';

class NewsTitle extends StatefulWidget {
  final NewsComplete newsComplete;
  const NewsTitle({Key? key, required this.newsComplete}) : super(key: key);
  @override
  State<NewsTitle> createState() => _NewsState();
}

class _NewsState extends State<NewsTitle> {
  List<NewsTitleComplete> _datasComments = <NewsTitleComplete>[];

  Future<List<NewsTitleComplete>> fetchDataComments() async {
    var url =
        'https://jsonplaceholder.typicode.com/comments/?postId=${widget.newsComplete.id}';
    var responce = await get(Uri.parse(url));
    var data = <NewsTitleComplete>[];
    if (responce.statusCode == 200) {
      var datasJson = json.decode(responce.body);
      for (var dataJson in datasJson) {
        data.add(NewsTitleComplete.fromJson(dataJson));
      }
    }
    return data;
  }

  @override
  void initState() {
    fetchDataComments().then((value) {
      setState(() {
        _datasComments.addAll(value);
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
        title: Text('Title',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15,
            )),
        centerTitle: true,
        backgroundColor: color1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 33, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.newsComplete.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 26.0,
                  ),
                  Text(
                    widget.newsComplete.body,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (_datasComments.length.toDouble() / 2).toInt(),
              itemBuilder: (context, index) {
                return Card(
                  color: color2,
                  margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            size: 40,
                            color: Colors.white,
                          ),
                          title: Text(
                            _datasComments[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 18),
                        child: Text(
                          _datasComments[index].body,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: color1,
        height: 64,
        margin: EdgeInsets.fromLTRB(0, 37, 0, 0),
        child: Container(
          width: 337.5,
          margin: EdgeInsets.fromLTRB(15, 0, 7.5, 0),
          child: GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const NewsTitleComments())); //newsTitleComments: _datasComments[index]
            // },
            child: Row(
              children: [
                Container(
                  width: 284.67,
                  margin: EdgeInsets.fromLTRB(10.67, 8, 0, 8.33),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Show me',
                        style: TextStyle(color: Colors.grey, fontSize: 18.67),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '${_datasComments.length} results',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.67,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15.18, 24.93, 15.19, 23.76),
                  child: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
