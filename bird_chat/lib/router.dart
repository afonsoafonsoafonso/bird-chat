import 'package:bird_chat/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/screens/CreatePage.dart';
import 'package:bird_chat/screens/HomeView.dart';
import 'package:bird_chat/screens/UndefinedView.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case HomeView.route:
      return MaterialPageRoute(builder: (context) => Home());
    case CreatePage.route:
      return MaterialPageRoute(builder: (context) => CreatePage());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  
  }

} 