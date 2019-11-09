import 'package:flutter/material.dart';
import 'package:bird_chat/screens/home.dart';
import 'package:bird_chat/widgets/home_body2.dart';

void main() {

  List<EventOverview> events = generateEvents(30);

  runApp(
    MaterialApp(
      title: 'Bird Chat',
      debugShowCheckedModeBanner: false,
      home: new HomeBody(events: events,),
    )
  );
}

List<EventOverview> generateEvents(int eventsNo) {
  return List.generate(eventsNo, (int index) {
    return EventOverview(
      eventName: 'Talking about very nice tecnology #$index w/ Sr Julio',
      eventTimeLocation: '$index/04/20 18h30 @ Bar da Biblio',
      eventSummary: 'Quem ler isto é ganda gay looooooooooooooooooooooooooooooooooooooooooooooooool',
    );
  });
}