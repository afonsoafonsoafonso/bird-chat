import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {
  static const String route = "/chat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "chat_name"
        ),
      ),
      body: Column(
        children : <Widget> [
          MessageList(),
          ChatForm(),
        ],
      ),
    );
  }
  
}

class ChatForm extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: this.textController,
            ),
          ),
          FloatingActionButton(
            mini: true,
            clipBehavior: Clip.antiAlias,
            child: Icon(Icons.send),
            onPressed: _submit,
          )
        ],
      ),
    );
  }

  void _submit() {
    print(textController.text);
    textController.clear();
    return;
  }
}

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  final scrollController = new ScrollController();
  final lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

  final messages = <String>[];

  @override
  void initState() {
    super.initState();
    _populateMessages();
  }

  Widget _buildMessageCard(int i, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text("username$i", style: TextStyle(

              fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Text("$text"),
          )
        ],
      ),
    );
  }

  void _populateMessages() {
    for (int i = 0; i < 10; i++) {
      messages.add(lorem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        reverse: true,
        padding: EdgeInsets.all(10),
        itemBuilder: (context,i) {
          if (i % 2 == 1) {
            return Divider(
              thickness: 2,
            );
          }

          int index = i ~/ 2;
          if (index >= messages.length) {
            _populateMessages();
          }

          return _buildMessageCard(index, messages[index]);
        },
      ),
    );
  }
}