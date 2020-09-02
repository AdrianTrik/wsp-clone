import 'package:wsp_clone/model/contact.dart';

class ContactService {
  static const path = 'images/profile-pictures/';

  static List<Contact> getContacts() {
    return [
      Contact(
        'Angelina Jolie',
        'I\'ve been reckless, but I\'m not a rebel without a cause',
        path + 'AngelinaJolie.jpg',
      ),
      Contact(
        'Ariana Grande',
        'Be happy being you',
        path + 'ArianaGrande.jpg',
      ),
      Contact(
        'Cristiano Ronaldo',
        'Fique forte, seja corajoso. Vá além',
        path + 'CristianoRonaldo.jpg',
      ),
      Contact(
        'George Clooney',
        'You have only a short period of time in your life to make your mark, and I\'m there now.',
        path + 'GeorgeClooney.jpg',
      ),
      Contact(
        'Jennifer Aniston',
        'There are no regrets in life, just lessons',
        path + 'JenniferAniston.jpg',
      ),
      Contact(
        'Jennifer Lopez',
        'No matter where I go, I know where I came from',
        path + 'JenniferLopez.jpg',
      ),
      Contact(
        'Johnny Depp',
        'Music touches us emotionally, where words alone can\'t',
        path + 'JohnnyDepp.jpg',
      ),
      Contact(
        'Tom Cruise',
        'I\'m passionate about learning',
        path + 'TomCruise.jpg',
      ),
      Contact(
        'Tom Hanks',
        'A hero is someone who voluntarily walks into the unknown',
        path + 'TomHanks.jpg',
      ),
      Contact(
        'Will Smith',
        'The first step is you have to say you can',
        path + 'WillSmith.jpg',
      ),
    ];
  }
}
