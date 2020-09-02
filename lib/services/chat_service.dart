import 'package:wsp_clone/model/chat.dart';
import 'package:wsp_clone/model/chat_state.dart';
import 'package:wsp_clone/model/contact.dart';
import 'package:wsp_clone/services/contact_service.dart';

class ChatService {
  static List<Chat> getChats() {
    List<Contact> contacts = ContactService.getContacts();

    return [
      Chat(
        contacts[3],
        'Well... Maybe that\'s why I\'m talking to you',
        DateTime.now().subtract(Duration(minutes: 10)),
        false,
        ChatState.SENDING,
        false,
      ),
      Chat(
        contacts[5],
        'It\'s time to retake our classes',
        DateTime.now().subtract(Duration(hours: 1)),
        false,
        ChatState.RECEIVED,
        false,
      ),
      Chat(
        contacts[1],
        'I don\'t regret any of the life decisions I\'ve made in my life because with every choice I\'ve made I\'ve learned something new',
        DateTime.now().subtract(Duration(hours: 3, minutes: 8)),
        false,
        ChatState.RECEIVED,
        false,
      ),
      Chat(
        contacts[6],
        'Yes, sure!',
        DateTime.now().subtract(Duration(hours: 4, minutes: 54)),
        false,
        ChatState.SENT,
        false,
      ),
      Chat(
        contacts[8],
        'The cinema has the power to make you not feel lonely',
        DateTime.now().subtract(Duration(hours: 5, minutes: 42)),
        false,
        ChatState.RECEIVED,
        false,
      ),
      Chat(
        contacts[7],
        'That\'s awesome!',
        DateTime.now().subtract(Duration(hours: 6, minutes: 35)),
        false,
        ChatState.VIEWED,
        false,
      ),
      Chat(
        contacts[0],
        'I will do the best I can',
        DateTime.now().subtract(Duration(hours: 7, minutes: 46)),
        false,
        ChatState.VIEWED,
        false,
      ),
      Chat(
        contacts[2],
        'Estou vivendo um sonho do qual nunca mais quero acordar',
        DateTime.now().subtract(Duration(hours: 8, minutes: 34)),
        false,
        ChatState.RECEIVED,
        false,
      ),
      Chat(
        contacts[4],
        'Hahaha ok, I will talk with Selena',
        DateTime.now().subtract(Duration(hours: 9, minutes: 37)),
        false,
        ChatState.VIEWED,
        false,
      ),
    ];
  }
}
