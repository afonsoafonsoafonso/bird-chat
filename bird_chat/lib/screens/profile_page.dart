import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile {
  Profile({this.name, this.picUrl, this.bio, this.affiliation, this.url});

  final String picUrl;
  final String name;
  final String bio;
  final String affiliation;
  final String url;
}


class ProfilePage extends StatelessWidget {
  ProfilePage({@required this.profile});
  
  final Profile profile;
  
  static const String route = 'profile';

  _launchURL() async {
    const url = 'http://dardin88.github.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(),
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: double.infinity,
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: double.infinity),
                    CircleAvatar(
                      radius: 85,
                      backgroundImage: NetworkImage(
                          profile.picUrl,
                          //'https://2019.programming-conference.org/getProfileImage/dariodinucci/6e954823-249a-484f-9dbf-e5462d7fa78e/small.jpg'),
                    )),
                    Text(
                      //'Dario Di Nucci',
                      profile.name,
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      profile.bio,
                      //'I am a research fellow at the Software Languages Lab of the Vrije Universiteit Brussel in Belgium. I received the PhD in Management and Information Technology from the University of Salerno in 2018 advised by Prof. Andrea De Lucia with a thesis entitled Methods and Tools for Focusing and Prioritizing the Testing Effort.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        height: 1,
                        width: 350,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      width: 350,
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 10, top: 5, bottom: 5),
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  profile.affiliation,
                                  //'Vrije Universiteit Brussel',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: _launchURL,
                            child: Card(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 10, top: 5, bottom: 5),
                                    child: Icon(
                                      Icons.insert_link,
                                      color: Colors.blue,
                                      size: 35,
                                    ),
                                  ),
                                  Text(
                                    profile.url,
                                    //'http://dardin88.github.io',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: double.infinity,
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
