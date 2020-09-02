import 'package:flutter/material.dart';
import 'package:wsp_clone/components/custom_scroll_bar.dart';
import 'package:wsp_clone/model/contact.dart';
import 'package:wsp_clone/services/contact_service.dart';

import '../../constants.dart';

class NewCallView extends StatefulWidget {
  @override
  _NewCallViewState createState() => _NewCallViewState();
}

class _NewCallViewState extends State<NewCallView> {
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
                color: kTextColor,
              ),
            ),
            Text(
              '${contacts.length} contacts',
              style: TextStyle(
                color: kGreyColor,
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
                    'New group call',
                    style: TextStyle(color: kTextColor),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: kAccentColor,
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
                      style: TextStyle(color: kTextColor),
                    ),
                    subtitle: Text(
                      contact.state,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: kGreyColor),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(contact.profileImgSrc),
                      radius: 25.0,
                    ),
                    trailing: Wrap(
                      spacing: 24,
                      children: <Widget>[
                        Icon(Icons.call, color: kAccentColor),
                        Icon(Icons.videocam, color: kAccentColor),
                      ],
                    ),
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
