import 'call_state.dart';
import 'contact.dart';

class Call {
  Contact contact;
  DateTime date;
  bool video;
  CallState state;

  Call(this.contact, this.date, this.video, this.state);
}
