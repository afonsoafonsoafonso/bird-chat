import 'package:flutter/material.dart';

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
