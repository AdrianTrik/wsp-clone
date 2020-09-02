import 'package:flutter/material.dart';
import 'package:wsp_clone/model/chat_state.dart';
import '../constants.dart';

class ChatUtil {
  static Icon getIconFromState(ChatState state) {
    if (state == ChatState.RECEIVED) return null;

    IconData iconData;
    Color color = kGreyColor;

    switch (state) {
      case ChatState.PENDING_SEND:
        iconData = Icons.access_time;
        break;
      case ChatState.SENDING:
        iconData = Icons.done;
        break;
      case ChatState.SENT:
        iconData = Icons.done_all;
        break;
      case ChatState.VIEWED:
        iconData = Icons.done_all;
        color = kViewedColor;
        break;
      default:
        break;
    }

    return Icon(
      iconData,
      color: color,
      size: 18.0,
    );
  }
}
