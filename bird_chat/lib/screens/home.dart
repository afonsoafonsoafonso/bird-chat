import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/myEvents_body.dart';
import 'package:bird_chat/widgets/home_body2.dart';

List<EventOverview> events = generateEvents(30);

List<EventOverview> generateEvents(int eventsNo) {
  return List.generate(eventsNo, (int index) {
    return EventOverview(
      eventName: 'Talking about very nice tecnology #$index w/ Sr Julio',
      eventTimeLocation: '$index/04/20 18h30 @ Bar da Biblio',
      eventSummary: 'Quem ler isto é ganda gay looooooooooooooooooooooooooooooooooooooooooooooooool',
    );
  });
}

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  String page = "Home";
  Widget pageBody = HomeBody(events: events);

  final topBar = new AppBar(
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    elevation: 1.0,
    title: SizedBox(
      height: 35.0,
      child: Image.asset("assets/images/flock_logo.png")
    ),
  );

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: topBar,
      body: pageBody,
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        child: new BottomAppBar(
          child: new Row(
            // alignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  setState(() {

                    if(page == "Home") {
                      return;
                    }

                    page = "Home";
                    pageBody = HomeBody(events: events);
                    
                  });
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.search,
                ),
              ),
              new IconButton(
                icon: Icon(
                  Icons.event,
                ),
                onPressed: () {
                  setState(() {

                    if(page == "MyEvents") {
                      return;
                    }

                    page = "MyEvents";
                    pageBody = new MyEventsBody();

                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
      ),
    );
  }
}