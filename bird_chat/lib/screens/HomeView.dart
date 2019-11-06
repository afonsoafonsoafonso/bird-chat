import 'package:bird_chat/screens/CreatePage.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  static const String route = '/';
  const HomeView({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.route);
        },
        tooltip: 'Create New Group',
        child: new Icon(Icons.add),
      ),
    );
  }
}

