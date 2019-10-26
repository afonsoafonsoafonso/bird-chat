import 'package:bird_chat/screens/screen1.dart';
import 'package:bird_chat/screens/secondeScreen.dart';
import 'package:bird_chat/screens/undefinedView.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/routingConstants.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case SecondScreenRoute:
      return MaterialPageRoute(builder: (context) => SecondScreen());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  
  }

} 