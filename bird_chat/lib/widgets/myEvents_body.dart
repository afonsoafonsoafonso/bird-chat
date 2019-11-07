import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/event_Container.dart';

class MyEventsBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        Expanded (
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              new EventContainer(),
            ]
          )
        ),
      ]
    );
  }
}