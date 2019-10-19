import 'package:flutter/material.dart';
import 'package:bird_chat/create_page.dart';

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

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bird Chat'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Go to create page'),
          onPressed: () {
            // Pushs the SecondScreen widget onto the navigation stack
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CreatePage()));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
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
