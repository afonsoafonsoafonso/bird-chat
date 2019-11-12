import 'package:bird_chat/screens/ChatPage.dart';
import 'package:bird_chat/screens/profile_page.dart';
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
    elevation: 1.0,
    title: SizedBox(
      height: 35.0
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
                    Navigator.pushNamed(context, ProfilePage.route, arguments: Profile(name: 'Dario Di Nucci', picUrl: 'https://2019.programming-conference.org/getProfileImage/dariodinucci/6e954823-249a-484f-9dbf-e5462d7fa78e/small.jpg', bio: 'I am a research fellow at the Software Languages Lab of the Vrije Universiteit Brussel in Belgium. I received the PhD in Management and Information Technology from the University of Salerno in 2018 advised by Prof. Andrea De Lucia with a thesis entitled Methods and Tools for Focusing and Prioritizing the Testing Effort.', url: 'http://dardin88.github.io', affiliation: 'Vrije Universiteit Brussel'));

                  }
                ),
                ListTile(
                  title: Text('Example Chat'),
                  onTap:(){
                    Navigator.pop(context);
                    //filler until we have profile app
                    Navigator.pushNamed(context, ChatPage.route);

                  }
                )
              ],
            ),
          ),
    );
  }
}
