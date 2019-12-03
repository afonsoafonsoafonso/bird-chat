import 'package:bird_chat/models/User.dart';
import 'package:bird_chat/services/DatabaseMock.dart';

class Session {
  static User user;

  static setCurrentUser(String userID) {
    user = DatabaseMock.getUser(userID);
  } 
}