import 'package:wsp_clone/model/call.dart';
import 'package:wsp_clone/model/call_state.dart';
import 'package:wsp_clone/model/contact.dart';
import 'contact_service.dart';

class CallService {
  static List<Call> getCalls() {
    List<Contact> contacts = ContactService.getContacts();

    return [
      Call(
        contacts[0],
        DateTime.now().subtract(Duration(hours: 1, minutes: 36)),
        true,
        CallState.RECEIVED,
      ),
      Call(
        contacts[1],
        DateTime.now().subtract(Duration(hours: 2, minutes: 17)),
        false,
        CallState.MADE,
      ),
      Call(
        contacts[2],
        DateTime.now().subtract(Duration(hours: 3, minutes: 8)),
        false,
        CallState.LOST,
      ),
      Call(
        contacts[0],
        DateTime.now().subtract(Duration(hours: 4, minutes: 57)),
        false,
        CallState.LOST,
      ),
      Call(
        contacts[1],
        DateTime.now().subtract(Duration(hours: 5, minutes: 15)),
        true,
        CallState.RECEIVED,
      ),
      Call(
        contacts[3],
        DateTime.now().subtract(Duration(hours: 6, minutes: 26)),
        false,
        CallState.MADE,
      ),
      Call(
        contacts[4],
        DateTime.now().subtract(Duration(hours: 7, minutes: 34)),
        false,
        CallState.LOST,
      ),
      Call(
        contacts[1],
        DateTime.now().subtract(Duration(hours: 8, minutes: 51)),
        false,
        CallState.LOST,
      ),
      Call(
        contacts[8],
        DateTime.now().subtract(Duration(hours: 9, minutes: 10)),
        true,
        CallState.RECEIVED,
      ),
      Call(
        contacts[6],
        DateTime.now().subtract(Duration(hours: 9, minutes: 12)),
        false,
        CallState.MADE,
      ),
      Call(
        contacts[7],
        DateTime.now().subtract(Duration(hours: 9, minutes: 20)),
        false,
        CallState.LOST,
      ),
      Call(
        contacts[7],
        DateTime.now().subtract(Duration(hours: 9, minutes: 35)),
        false,
        CallState.LOST,
      ),
    ];
  }
}
