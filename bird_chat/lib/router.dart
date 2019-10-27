import 'package:bird_chat/screens/create_page.dart';
import 'package:bird_chat/screens/screen1.dart';
import 'package:bird_chat/screens/undefinedView.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/routingConstants.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case CreateGroupRoute:
      return MaterialPageRoute(builder: (context) => CreatePage());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  
  }

} 