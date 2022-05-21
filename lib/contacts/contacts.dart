import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'completes/contacts_complete.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<ContactsComplete> dataContacts = <ContactsComplete>[];

  Future<List<ContactsComplete>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var responce = await get(Uri.parse(url));
    var data = <ContactsComplete>[];
    if (responce.statusCode == 200) {
      var datasJson = json.decode(responce.body);
      for (var dataJson in datasJson) {
        data.add(ContactsComplete.fromJson(dataJson));
      }
    }
    return data;
  }

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        dataContacts.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color1 = const Color(0xff231D49);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Contacts',
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
        itemCount: dataContacts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 9, bottom: 9),
            child: Padding(
              padding: EdgeInsets.fromLTRB(31, 8, 125, 8),
              child: ListTile(
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => ContactProfile(contactsComplete: dataContacts[index]e,)));
                // },
                leading: Icon(
                  Icons.account_circle,
                  size: 32,
                  color: Colors.white,
                ),
                title: Text(
                  dataContacts[index].name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
