import 'package:bird_chat/routingConstants.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() {
  runApp(NavigationExampleApp());
}

class NavigationExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The MaterialApp's home is automatically set as the bottom of the navigation stack
    return MaterialApp(
      title: 'Bird Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeViewRoute,
      //onUnknownRoute:(settings)=> MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name)),
    );
  }
}





