import 'package:flutter/material.dart';
import 'package:wsp_clone/components/custom_scroll_bar.dart';
import 'package:wsp_clone/constants.dart';
import 'package:wsp_clone/model/call.dart';
import 'package:wsp_clone/model/call_state.dart';
import 'package:wsp_clone/services/call_service.dart';
import 'package:wsp_clone/util/date_util.dart';
import 'dart:math' as math;
import 'new_call_view.dart';

class CallsView extends StatefulWidget {
  @override
  _CallsViewState createState() => _CallsViewState();
}

class _CallsViewState extends State<CallsView> {
  List<Call> calls;

  @override
  void initState() {
    calls = CallService.getCalls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollBar(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 70.0),
          itemBuilder: (context, index) {
            final call = calls[index];

            return ListTile(
              title: Text(
                call.contact.name,
                style: TextStyle(color: kTextColor),
              ),
              subtitle: Row(
                children: <Widget>[
                  Icon(
                    call.state == CallState.MADE
                        ? Icons.call_made
                        : Icons.call_received,
                    color:
                        call.state == CallState.LOST ? kMissed : kAccentColor,
                    size: 15.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      DateUtil.formatDate(call.date),
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(call.contact.profileImgSrc),
                radius: 25.0,
              ),
              trailing: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Icon(
                  call.video ? Icons.videocam : Icons.call,
                  color: kAccentColor,
                ),
              ),
            );
          },
          itemCount: calls.length,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '',
            onPressed: () {},
            child: kIconVideoChatGroup,
            backgroundColor: kSecondaryButton,
            mini: true,
          ),
          SizedBox(height: 15.0),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewCallView()),
              );
            },
            child: Icon(Icons.add_call),
          ),
        ],
      ),
    );
  }
}
