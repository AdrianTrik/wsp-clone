import 'package:flutter/material.dart';
import 'package:wsp_clone/components/custom_scroll_bar.dart';
import 'package:wsp_clone/model/contact.dart';
import 'package:wsp_clone/services/contact_service.dart';

import '../../constants.dart';
import 'chat_detail_view.dart';

class NewChatView extends StatefulWidget {
  @override
  _NewChatViewState createState() => _NewChatViewState();
}

class _NewChatViewState extends State<NewChatView> {
  List<Contact> contacts;

  @override
  void initState() {
    contacts = ContactService.getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select contact',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '${contacts.length} contacts',
              style: TextStyle(
                color: Color(0xFF899198),
                fontSize: 13.0,
              ),
            ),
          ],
        ),
        actions: kDefaultOptions,
      ),
      body: CustomScrollBar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                child: ListTile(
                  title: Text(
                    'New group',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF01AF9D),
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    radius: 25.0,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return ListTile(
                    title: Text(
                      contact.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      contact.state,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color(0xFF929BA3)),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(contact.profileImgSrc),
                      radius: 25.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailView(
                            contact: contact,
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: contacts.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
