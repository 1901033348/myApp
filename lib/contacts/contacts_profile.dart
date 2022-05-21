import 'package:flutter/material.dart';

import 'completes/contacts_complete.dart';

class ContactProfile extends StatefulWidget {
  final ContactsComplete contactsComplete;
  const ContactProfile({Key? key, required this.contactsComplete})
      : super(key: key);

  @override
  State<ContactProfile> createState() => _ContactProfileState();
}

class _ContactProfileState extends State<ContactProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sdad'),
      ),
    );
  }
}
