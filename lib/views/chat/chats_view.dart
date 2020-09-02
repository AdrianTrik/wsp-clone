import 'package:flutter/material.dart';
import 'package:wsp_clone/components/bottom_end_icon.dart';
import 'package:wsp_clone/components/custom_image_avatar.dart';
import 'package:wsp_clone/components/custom_scroll_bar.dart';
import 'package:wsp_clone/constants.dart';
import 'package:wsp_clone/model/chat.dart';
import 'package:wsp_clone/services/chat_service.dart';
import 'package:wsp_clone/util/chat_util.dart';
import 'package:wsp_clone/util/date_util.dart';
import 'package:wsp_clone/views/chat/chat_detail_view.dart';
import 'new_chat_view.dart';

class ChatsView extends StatefulWidget {
  @override
  _ChatsViewState createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  List<Chat> chats;
  int chatsSelected;

  @override
  void initState() {
    chats = ChatService.getChats();
    chatsSelected = 0;
    super.initState();
  }

  void changeChatState(Chat chat) {
    setState(() {
      chat.selected = !chat.selected;
      chat.selected ? chatsSelected++ : chatsSelected--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollBar(
        child: ListView.separated(
          padding: EdgeInsets.only(bottom: 70.0),
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 87.0,
                right: 12.0,
                top: 0,
                bottom: 0,
              ),
              child: Container(
                color: kGreyColor,
                height: 0.25,
              ),
            );
          },
          itemBuilder: (context, index) {
            final chat = chats[index];

            return Ink(
              color: chat.selected ? kSelectedTile : Colors.transparent,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      chat.contact.name,
                      style: TextStyle(color: kTextColor),
                    ),
                    Text(
                      DateUtil.formatDate(chat.date),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      ChatUtil.getIconFromState(chat.state) ?? Container(),
                      SizedBox(width: 2.0),
                      Expanded(
                        child: Text(
                          chat.message,
                          style: TextStyle(
                            color: kGreyColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      chat.unreadMessages
                          ? Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kAccentColor,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                leading: CustomImageAvatar(
                  imgSrc: chat.contact.profileImgSrc,
                  bottomEndIcon: chat.selected
                      ? BottomEndIcon(
                          icon: Icon(
                            Icons.check,
                            size: 14.0,
                            color: kSelectedTile,
                          ),
                        )
                      : null,
                ),
                onTap: () {
                  chatsSelected > 0
                      ? changeChatState(chat)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailView(
                              contact: chat.contact,
                            ),
                          ),
                        );
                },
                onLongPress: () => changeChatState(chat),
              ),
            );
          },
          itemCount: chats.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewChatView()),
          );
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
