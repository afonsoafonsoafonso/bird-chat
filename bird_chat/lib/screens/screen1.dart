import 'package:flutter/material.dart';

import '../routingConstants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateGroupRoute);
        },
        tooltip: 'Create New Group',
        child: new Icon(Icons.add),
      ),
    );
  }
}
