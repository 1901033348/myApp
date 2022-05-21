import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'completes/check_complete.dart';

class Check extends StatefulWidget {
  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  Color colors = Colors.white;
  Color bgColors = Colors.white;

  List<CheckComplete> _datas = <CheckComplete>[];
  Future<List<CheckComplete>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var responce = await get(Uri.parse(url));
    var data = <CheckComplete>[];
    if (responce.statusCode == 200) {
      var datasJson = json.decode(responce.body);
      for (var dataJson in datasJson) {
        data.add(CheckComplete.fromJson(dataJson));
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
    const bgcolor = const Color(0xff221C44);
    const bgcolorofcheck = const Color(0xff6C63FF);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Check',
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
      body: ListView.builder(
        itemCount: _datas.length,
        itemBuilder: (context, index) {
          colors = (_datas[index].completed) ? Colors.white : Colors.blueGrey;
          bgColors = (_datas[index].completed) ? bgcolor : Colors.black;
          return Card(
            color: bgColors,
            margin: EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 0.0),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 25, top: 15, bottom: 14, right: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color(0xffDADADA),
                    ),
                    child: Checkbox(
                      checkColor: Colors.black,
                      value: _datas[index].completed,
                      onChanged: (value) {
                        setState(() {
                          _datas[index].completed = value!;
                        });
                      },
                      activeColor: bgcolorofcheck,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Padding(
                      padding: EdgeInsets.only(left: 47),
                      child: Text(
                        _datas[index].title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: colors,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
