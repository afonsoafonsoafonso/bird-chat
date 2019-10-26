import 'package:bird_chat/screens/create_page.dart';
import 'package:bird_chat/screens/FirstScreen.dart';
import 'package:bird_chat/screens/secondeScreen.dart';


MaterialApp(
  // Start the app with the "/" named route. In this case, the app starts
  // on the FirstScreen widget.
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => FirstScreen(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => SecondScreen(),
  },
);