import 'data.dart';

class Report {  //Changed just from user to report
  final User patient;
  final String title;
  final String text;
  final DateTime date;
  final String imageUrl;

  Report({this.patient, this.title, this.text, this.date, this.imageUrl});

}

final User currentUser = User(id: 0, name: 'Cap', imageUrl: 'images/captain.jpg');
final User groot = User(id: 1, name: 'Groot', imageUrl: 'images/groot.jpg');
final User ironman = User(id: 2, name: 'Iron Man', imageUrl: 'images/ironman.jpg');
final User panthar = User(id: 3, name: 'Black Panthar', imageUrl: 'images/panthar.jpg');
final User spiderman = User(id: 4, name: 'Spiderman', imageUrl: 'images/spiderman.jpg');
final User starlord = User(id: 4, name: 'Starlord', imageUrl: 'images/starlord.jpg');
final User thor = User(id: 4, name: 'Thor', imageUrl: 'images/thor.jpg');
final User widow = User(id: 4, name: 'Black Widow', imageUrl: 'images/widow.jpg');

//Favorite Contacts
List<User> favorites = [groot, spiderman, panthar, thor, starlord, widow];

// Example reports on home screen
List<Report> reportList = [
  Report(
      patient: groot,
      title: 'Antiphospholipid syndrome',
      text: "After returning from Titan",
      date: DateTime.utc(2020, 4, 4)
  ),
  Report(
      patient: panthar,
      title: 'Feline leukomyelopathy',
      text: "This is an important report forever.",
      date: DateTime.utc(2020, 4, 6)
  ),
  Report(
      patient: spiderman,
      title: 'Spider angioma',
      text: "Aunt May paid for this one",
      date: DateTime.utc(2020, 4, 9)
  ),
  Report(
      patient: ironman,
      title: 'Diseases of affluence',
      text: "Jarvis did not booked my appointment that day.",
      date: DateTime.utc(2020, 4, 11)
  ),
  Report(
      patient: widow,
      title: 'widowmaker heartattack',
      text: "I will not go to Dr. Bruce again :)",
      date: DateTime.utc(2020, 4, 22)
  )
];

// Example report in report screen
//List<Report> messages = [
//  Report(
//      patient: currentUser,
//      title: '5:36 PM',
//      text: "hi",
//      date: true,
//      unread: true
//  ),
//  Report(
//      patient: groot,
//      title: '5:30 PM',
//      text: "how are u')",
//      date: true,
//      unread: false
//  ),
//  Report(
//      patient: currentUser,
//      title: '5:36 PM',
//      text: "i am fine ",
//      date: true,
//      unread: true
//  ),
//  Report(
//      patient: groot,
//      title: '5:30 PM',
//      text: "can you tell me that when i have to take madecine",
//      date: true,
//      unread: false
//  ),
//  Report(
//      patient: spiderman,
//      title: '5:36 PM',
//      text: "in night",
//      date: false,
//      unread: true
//  ),
//  Report(
//      patient: ironman,
//      title: '7:30 PM',
//      text: "and in morning",
//      date: false,
//      unread: true
//  )
//];