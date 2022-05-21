import 'package:flutter/material.dart';

import 'check/check.dart';
import 'contacts/contacts.dart';
import 'gallery/gallery.dart';
import 'news/news.dart';

void main() {
  runApp(const MaterialApp(
    title: 'App',
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedIndex = 0;
  final title = [News(), Gallery(), Check(), Contacts()];
  @override
  Widget build(BuildContext context) {
    const bgcolor = const Color(0xff231D49);
    const unselectedcolor = const Color(0xff7F78A7);

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: unselectedcolor,
        backgroundColor: bgcolor,
        iconSize: 15,
        selectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_help),
            label: 'Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar),
            label: 'Contacts',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: title,
      ),
    );
  }
}
