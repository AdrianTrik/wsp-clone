import 'package:wsp_clone/model/chat_state.dart';
import 'package:wsp_clone/model/contact.dart';
import 'package:wsp_clone/model/message.dart';
import 'package:wsp_clone/services/contact_service.dart';

class MessageService {
  static List<Message> _getMessages() {
    List<Contact> contacts = ContactService.getContacts();

    return [
      Message(
        contacts[3],
        'What represent art to you?',
        DateTime.now().subtract(Duration(hours: 1, minutes: 5)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[3],
        'Art takes different forms… But it represents something that is basic in all of us—our history',
        DateTime.now().subtract(Duration(hours: 1, minutes: 5)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[3],
        'Our history, nice...',
        DateTime.now().subtract(Duration(hours: 1)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[3],
        'Have you ever failed at something?',
        DateTime.now().subtract(Duration(hours: 1)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[3],
        'The only failure is not to try',
        DateTime.now().subtract(Duration(minutes: 30)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[3],
        'Let me tell you something',
        DateTime.now().subtract(Duration(minutes: 30)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[3],
        'Failures are infinitely more instructive than successes',
        DateTime.now().subtract(Duration(minutes: 30)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[3],
        'Yes, I say that to myself',
        DateTime.now().subtract(Duration(minutes: 25)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[3],
        'Ok, that\'s good',
        DateTime.now().subtract(Duration(minutes: 20)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[3],
        'But you never really learn much from hearing yourself speak',
        DateTime.now().subtract(Duration(minutes: 20)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[3],
        'Well... Maybe that\'s why I\'m talking to you',
        DateTime.now().subtract(Duration(minutes: 10)),
        ChatState.SENDING,
      ),
      Message(
        contacts[5],
        'Ey! Adrián, how are you doing?',
        DateTime.now().subtract(Duration(hours: 5)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[5],
        'Hi Jennifer, I didn\'t answer before because I have a lot of work in progress',
        DateTime.now().subtract(Duration(hours: 1, minutes: 12)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[5],
        'I\'m fine, how about you?',
        DateTime.now().subtract(Duration(hours: 1, minutes: 12)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[5],
        'Working a lot also, I am doing classes online',
        DateTime.now().subtract(Duration(hours: 1, minutes: 11)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[5],
        'That\'s nice, I would do it if I had more time',
        DateTime.now().subtract(Duration(hours: 1, minutes: 10)),
        ChatState.VIEWED,
      ),
      Message(
        contacts[5],
        'Oh, come on! No excuses...',
        DateTime.now().subtract(Duration(hours: 1)),
        ChatState.RECEIVED,
      ),
      Message(
        contacts[5],
        'It\'s time to retake our classes',
        DateTime.now().subtract(Duration(hours: 1)),
        ChatState.RECEIVED,
      ),
    ];
  }

  static List<Message> getMessagesByContact(Contact contact) {
    List<Message> messages =
        _getMessages().where((m) => m.contact.name == contact.name).toList();
    messages.sort((a, b) => b.date.compareTo(a.date));

    return messages;
  }
}
