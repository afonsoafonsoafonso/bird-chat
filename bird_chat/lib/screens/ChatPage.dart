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
          drawTextField()
          ,
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
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "username$i",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 1, 1, 0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
        padding: EdgeInsets.all(5),
        itemBuilder: (context,i) {
          if (i >= messages.length) {
            _populateMessages();
          }

          return _buildMessageCard(i, messages[i]);
        },
      ),
    );
  }
}