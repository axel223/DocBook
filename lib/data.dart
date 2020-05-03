class User {
  final int id;
  final String name;
  final String imageUrl;

  User({this.id, this.name, this.imageUrl});

}

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});

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

// Example chats on home screen
List<Message> chats = [
  Message(
      sender: groot,
      time: '5:30 PM',
      text: "I am Groot",
      isLiked: true,
      unread: false
  ),
  Message(
      sender: panthar,
      time: '4:30 PM',
      text: "Wakanda forever",
      isLiked: false,
      unread: false
  ),
  Message(
      sender: spiderman,
      time: '5:60 PM',
      text: "friendly neighbourhood spiderman",
      isLiked: true,
      unread: true
  ),
  Message(
      sender: ironman,
      time: '7:30 PM',
      text: "I am iron man",
      isLiked: false,
      unread: true
  ),
  Message(
      sender: widow,
      time: '7:30 PM',
      text: "I'm sorry. Did I step on your moment?",
      isLiked: false,
      unread: true
  )
];

// Example chats in chat screen
List<Message> messages = [
  Message(
      sender: currentUser,
      time: '5:36 PM',
      text: "hi",
      isLiked: true,
      unread: true
  ),
  Message(
      sender: groot,
      time: '5:30 PM',
      text: "how are u')",
      isLiked: true,
      unread: false
  ),
  Message(
      sender: currentUser,
      time: '5:36 PM',
      text: "i am fine ",
      isLiked: true,
      unread: true
  ),
  Message(
      sender: groot,
      time: '5:30 PM',
      text: "can you tell me that when i have to take madecine",
      isLiked: true,
      unread: false
  ),
  Message(
      sender: spiderman,
      time: '5:36 PM',
      text: "in night",
      isLiked: false,
      unread: true
  ),
  Message(
      sender: ironman,
      time: '7:30 PM',
      text: "and in morning",
      isLiked: false,
      unread: true
  )
];