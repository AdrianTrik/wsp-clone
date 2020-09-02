import 'package:wsp_clone/model/call.dart';
import 'package:wsp_clone/model/call_state.dart';
import 'package:wsp_clone/model/contact.dart';
import 'package:wsp_clone/model/status.dart';

import 'contact_service.dart';

class StatusService {
  static const path = 'images/states/';

  static List<Status> getStatuses() {
    List<Contact> contacts = ContactService.getContacts();

    return [
      Status(
        contacts[9],
        path + 'WillSmith.jpg',
        DateTime.now().subtract(Duration(hours: 1, minutes: 5)),
        false,
      ),
      Status(
        contacts[8],
        path + 'TomHanks.jpg',
        DateTime.now().subtract(Duration(hours: 4, minutes: 53)),
        false,
      ),
      Status(
        contacts[7],
        path + 'TomCruise.jpg',
        DateTime.now().subtract(Duration(hours: 6, minutes: 10)),
        false,
      ),
      Status(
        contacts[6],
        path + 'JohnnyDepp.jpg',
        DateTime.now().subtract(Duration(hours: 7, minutes: 12)),
        false,
      ),
      Status(
        contacts[5],
        path + 'JenniferLopez.jpg',
        DateTime.now().subtract(Duration(hours: 8, minutes: 23)),
        false,
      ),
      Status(
        contacts[4],
        path + 'JenniferAniston.jpg',
        DateTime.now().subtract(Duration(hours: 8, minutes: 20)),
        true,
      ),
      Status(
        contacts[2],
        path + 'CristianoRonaldo.jpg',
        DateTime.now().subtract(Duration(hours: 8, minutes: 30)),
        true,
      ),
      Status(
        contacts[0],
        path + 'AngelinaJolie.jpg',
        DateTime.now().subtract(Duration(hours: 8, minutes: 40)),
        true,
      ),
    ];
  }
}
