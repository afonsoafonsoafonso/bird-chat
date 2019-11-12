import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/event_Container.dart';

import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/services/eventsService.dart';


class HomeBody extends StatelessWidget {

  final List<Event> events = [];
  Future<List<Event>> _events() async {
    return EventsService.getEvents('homeEvents');
  }

  @override
  Widget build(BuildContext context) {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        Padding (
          padding: const EdgeInsets.only(
            top: 15,
          )
        ), 
        FutureBuilder(
          future: _events(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data != null) {
              return Expanded (
                child: ListView.builder (
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Padding (
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 5
                      ),
                      child: new EventContainer(event: snapshot.data[index])
                    );
                  }
                )
              );
            }
            else {
              return Expanded (
                child: Container (
                  child: Center (
                    child: Image.asset(
                      "imgs/loading.gif",
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                  )
                )
              );
            }
          },
        )
      ]
    );
  }
}