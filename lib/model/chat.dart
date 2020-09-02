import 'contact.dart';
import 'chat_state.dart';

class Chat {
  Contact contact;
  String message;
  DateTime date;
  bool unreadMessages;
  ChatState state;
  bool selected;

  Chat(
    this.contact,
    this.message,
    this.date,
    this.unreadMessages,
    this.state,
    this.selected,
  );
}
