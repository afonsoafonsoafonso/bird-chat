import 'package:bird_chat/screens/home.dart';
import 'package:bird_chat/screens/ChatPage.dart';
import 'package:bird_chat/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/screens/CreatePage.dart';
import 'package:bird_chat/screens/UndefinedView.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case Home.route:
      return MaterialPageRoute(builder: (context) => Home());
    case CreatePage.route:
      return MaterialPageRoute(builder: (context) => CreatePage());
    case ChatPage.route:
      return MaterialPageRoute(builder: (context) => ChatPage());
    case ProfilePage.route:
      return MaterialPageRoute(builder: (context) => ProfilePage(profile: settings.arguments));
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  
  }

} 