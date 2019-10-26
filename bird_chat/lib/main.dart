import 'package:flutter/material.dart';
import 'package:bird_chat/screens/create_page.dart';
import 'package:bird_chat/screens/FirstScreen.dart';
import 'package:bird_chat/routes.dart';

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
      home: FirstScreen(),
    );
  }
}




class CreateScreen extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Go to First'),
          // Pops Second Screen off the navigation stack
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
