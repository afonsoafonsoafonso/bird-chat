import 'package:bird_chat/models/User.dart';
import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/screens/GroupInfoPage.dart';
import 'package:bird_chat/services/DatabaseMock.dart';
import 'package:bird_chat/services/MessagesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bird_chat/models/Message.dart';

class ChatPage extends StatelessWidget {
  static const String route = "/chat";

  final Event event;
  final MessagesController controller;

  ChatPage({this.event, this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, GroupInfoPage.route, arguments: event);
            },
          )
        ],
      ),
      body: new ChatPageBody(controller: controller, event: event,),
    );
  }
}

class ChatPageBody extends StatefulWidget {
  const ChatPageBody({
    Key key,
    @required this.controller,
    @required this.event
  }) : super(key: key);

  final MessagesController controller;
  final Event event;

  @override
  _ChatPageBodyState createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> {
  bool inGroup;

  @override
  void initState() {
    super.initState();

    inGroup = widget.event.attendees.contains("0");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (!inGroup) {
          Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text("You are not attending this event, do you want to join?"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: FlatButton(
                    autofocus: false,
                    clipBehavior: Clip.antiAlias,
                    child: Text("Join"),
                    color: Colors.blue,
                    onPressed: (){_attendEvent();},
                  ),
                )
              ],
            ),
          )
        }.first,
        MessageList(controller: widget.controller),
        ChatForm(controller: widget.controller),
      ],
    );
  }

  void _attendEvent() {
    DatabaseMock.attendEvent(widget.event, User(key: "0", affiliation: '', bio: '', name: 'Menino', picUrl: '', url: ''));

    setState(() {
      inGroup = widget.event.attendees.contains("0");
    });
  }
}

class ChatForm extends StatefulWidget {

  final MessagesController controller;
  ChatForm({this.controller});

  @override
  _ChatFormState createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  final textController = new TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    
    super.dispose();
  }

  Widget drawTextField() {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        controller: this.textController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          drawTextField(),
          FloatingActionButton(
            mini: true,
            clipBehavior: Clip.antiAlias,
            child: Icon(Icons.send),
            onPressed: _submit,
          )
        ],
      ),
      padding: EdgeInsets.all(5),
      color: Theme.of(context).backgroundColor,
    );
  }

  void _submit() {
    String text = textController.text;

    widget.controller.addMessage(Message(
      key: "0",
      text: text,
      timestamp: new DateTime.now().millisecondsSinceEpoch,
    ));
    textController.clear();

    return;
  }
}

class MessageList extends StatefulWidget {

  final MessagesController controller;
  MessageList({this.controller});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final scrollController = new ScrollController();

  List<Message> messages = <Message>[];
  String idUser = "0";

  @override
  void initState() {
    super.initState();

    widget.controller.updateFunction = (msgs) {
      setState(() {
        messages = msgs;
      });
    };
    widget.controller.getMessages();
  }

  Widget _buildMessageCard(int i, Message msg) {

    bool ownMessage = msg.key == idUser;

    User user = DatabaseMock.getUser(msg.key);

    String username = ownMessage ? "You" : "${user.name}";

    Widget userTitle = Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        children: <Widget>[
          if (!ownMessage) { 
            CircleAvatar(
             maxRadius: 15,
             backgroundImage: NetworkImage(
               user.picUrl
             ),
            )
          }.first,
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    Color msgBg = ownMessage ? Theme.of(context).backgroundColor.withAlpha(190) : Color.fromRGBO(1, 1, 1, 0.05);

    Widget textContainer = Container(
      decoration: BoxDecoration(
        color: msgBg,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Text("${msg.text}"),
    );

    MainAxisAlignment alignment = ownMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: alignment,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              userTitle,
              textContainer
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        reverse: true,
        padding: EdgeInsets.all(5),
        itemCount: messages.length,
        itemBuilder: (context, i) {
          return _buildMessageCard(i, messages[i]);
        },
      ),
    );
  }
}
