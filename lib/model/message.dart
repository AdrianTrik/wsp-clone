import 'contact.dart';
import 'chat_state.dart';

class Message {
  Contact contact;
  String message;
  DateTime date;
  ChatState state;

  Message(
    this.contact,
    this.message,
    this.date,
    this.state,
  );
}
