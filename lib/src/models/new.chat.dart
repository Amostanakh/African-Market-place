import 'package:afyef/src/models/user.dart';

class Message {
  final User sender;
  final String avatar;
  final String time;
  final int unreadCount;
  final bool isRead;
  final String text;

  Message({
    required this.sender,
    required this.avatar,
   required this.time,
   required this.unreadCount,
   required this.text,
   required this.isRead,
  });
}

final List<Message> recentChats = [
  Message(
    sender: addison,
    avatar: 'assets/images/Addison.jpg',
    time: '01:25',
    text: "typing...",
    unreadCount: 1, isRead: true,
  ),
  Message(
    sender: jason,
    avatar: 'assets/images/Jason.jpg',
    time: '12:46',
    text: "Will I be in it?",
    unreadCount: 1, isRead: false,
  ),
  Message(
    sender: deanna,
    avatar: 'assets/images/Deanna.jpg',
    time: '05:26',
    text: "That's so cute.",
    unreadCount: 3,
    isRead: false,
  ),
  Message(
      sender: nathan,
      avatar: 'assets/images/Nathan.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      isRead: false,
      unreadCount: 2),
];

final List<Message> allChats = [
  Message(
    sender: virgil,
    avatar: 'images/p2.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: false,
  ),
  Message(
    sender: stanley,
    avatar: 'images/p2.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),
   Message(
    sender: virgil,
    avatar: 'images/p2.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: false,
  ),
  Message(
    sender: stanley,
    avatar: 'images/p2.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),
   Message(
    sender: virgil,
    avatar: 'images/p2.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: false,
  ),
  Message(
    sender: stanley,
    avatar: 'images/p2.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),

];

final List<Message> messages = [
  Message(
    sender: addison,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...", unreadCount: 0, isRead: false,
  ),

    Message(
    sender: addison,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...", unreadCount: 0, isRead: false,
  ),
    Message(
    sender: addison,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...", unreadCount: 0, isRead: false,
  ),
    Message(
    sender: addison,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...", unreadCount: 0, isRead: false,
  ),
  
  Message(
    sender: currentUser,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...", unreadCount: 0, isRead: false,
  ), 
];