import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:wsp_clone/components/custom_scroll_bar.dart';
import 'package:wsp_clone/model/chat_state.dart';
import 'package:wsp_clone/model/contact.dart';
import 'package:wsp_clone/model/message.dart';
import 'package:wsp_clone/services/message_service.dart';
import 'package:wsp_clone/util/chat_util.dart';
import 'package:wsp_clone/util/date_util.dart';
import '../../constants.dart';

class ChatDetailView extends StatefulWidget {
  final Contact contact;

  ChatDetailView({@required this.contact});

  @override
  _ChatDetailViewState createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  List<Message> _messages;
  String _newMessage = '';
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _messages = MessageService.getMessagesByContact(widget.contact);
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  sendMessage() {
    setState(() {
      _messages.insert(
          0,
          Message(
            widget.contact,
            _newMessage,
            DateTime.now(),
            ChatState.SENDING,
          ));

      _newMessage = '';
      _textController.clear();
    });
  }

  changeLastMesssageState(ChatState state) {
    setState(() {
      _messages[0].state = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.0, right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.contact.profileImgSrc),
                radius: 20.0,
              ),
            ),
            Text(widget.contact.name),
          ],
        ),
        actions: <Widget>[
          Wrap(
            spacing: 15.0,
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              Icon(
                Icons.videocam,
                color: Colors.white,
              ),
              Icon(
                Icons.call,
                color: Colors.white,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/chat_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollBar(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: <Widget>[
                      Bubble(
                        alignment: Alignment.center,
                        color: kPrimaryColor,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 2.0, right: 4.0),
                              child: Icon(
                                Icons.lock,
                                color: kWarningColor,
                                size: 12.0,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'Messages to this chat and calls are now secured with end-to-end encryption. Tap for more info.',
                                style: TextStyle(
                                  color: kWarningColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        margin: BubbleEdges.only(
                          left: 25.0,
                          right: 25.0,
                          top: 10.0,
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final message = _messages[index];

                          if (message.state == ChatState.RECEIVED) {
                            return Bubble(
                              margin: BubbleEdges.only(
                                top: 10,
                                left: 10.0,
                                right: 50.0,
                              ),
                              alignment: Alignment.topLeft,
                              nip: BubbleNip.leftTop,
                              color: kPrimaryColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      message.message,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 0.2,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 10.0),
                                    child: Text(
                                      DateUtil.formatDate(message.date),
                                      style: TextStyle(color: kGreyColor),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Bubble(
                              margin: BubbleEdges.only(
                                top: 10,
                                right: 10.0,
                                left: 50.0,
                              ),
                              alignment: Alignment.topRight,
                              nip: BubbleNip.rightTop,
                              color: kMessageSentColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      message.message,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          DateUtil.formatDate(message.date),
                                          style: TextStyle(color: kGreyColor),
                                        ),
                                        SizedBox(width: 5.0),
                                        ChatUtil.getIconFromState(
                                            message.state),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        itemCount: _messages.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Color(0xFF2C373D),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(color: kGreyColor),
                                  icon: Icon(
                                    Icons.tag_faces,
                                    color: kGreyColor,
                                  ),
                                ),
                                onChanged: (message) {
                                  setState(() {
                                    _newMessage = message;
                                  });
                                },
                                controller: _textController,
                                cursorColor: kAccentColor,
                                style: TextStyle(color: kGreyColor),
                              ),
                            ),
                            Transform.rotate(
                              angle: 100,
                              child: Icon(
                                Icons.attach_file,
                                color: kGreyColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.camera_alt,
                                color: kGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FloatingActionButton(
                      backgroundColor: kAccentColor,
                      child: Icon(
                        _newMessage != '' ? Icons.send : Icons.mic,
                        color: Colors.white,
                        size: 26,
                      ),
                      onPressed: () async {
                        sendMessage();

                        await Future.delayed(Duration(seconds: 1));

                        changeLastMesssageState(ChatState.SENT);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
