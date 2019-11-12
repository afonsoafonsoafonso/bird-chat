import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/home_body.dart';
import 'package:bird_chat/widgets/myEvents_body.dart';
import 'package:bird_chat/widgets/event_notification.dart';
import 'CreatePage.dart';


class Home extends StatefulWidget {
  static const String route = '/';

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  String page = "Home";

  Widget pageBody = new HomeBody();

  final topBar = new AppBar(
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    elevation: 1.0
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: pageBody,
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.07,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  setState(() {
                    if (page == "Home") {
                      return;
                    }

                    page = "Home";
                    pageBody = new HomeBody();
                  });
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
              new Stack(children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.event,
                  ),
                  onPressed: () {
                    setState(() {
                      if (page == "MyEvents") {
                        return;
                      }

                      page = "MyEvents";
                      pageBody = new MyEventsBody();
                    });
                  },
                ),
                new EventNotification(),
              ])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, CreatePage.route);
          },
          tooltip: 'Create New Group',
      ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Header'),
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                ListTile(
                  title: Text('My Profile'),
                  onTap:(){
                    Navigator.pop(context);
                    //filler until we have profile app
                    Navigator.pushNamed(context, CreatePage.route);

                  }
                )
              ],
            ),
          ),
    );
  }
}
