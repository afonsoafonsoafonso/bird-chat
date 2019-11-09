import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventOverview {
  EventOverview({
    this.eventName,
    this.eventTimeLocation,
    this.eventSummary,
    this.isExpanded = false,
  });

  String eventName;
  String eventTimeLocation;
  String eventSummary;
  bool isExpanded;
}

class HomeBody extends StatefulWidget {
  final List<EventOverview> events;

  HomeBody({Key key, this.events}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState(this.events);
}

class _HomeBodyState extends State<HomeBody> {
  List<EventOverview> events;

  _HomeBodyState(this.events);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              events[index].isExpanded = !isExpanded;
            });
          },
          children: events.map<ExpansionPanel>((EventOverview event) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(event.eventName),
                );
              },
              body: ListTile(
                title: Text(event.eventSummary),
                subtitle: Text(event.eventTimeLocation),
                trailing: Icon(Icons.search),
                onTap: () {
                  // ir para a window do respetivo evento
                },
              ),
              isExpanded: event.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
