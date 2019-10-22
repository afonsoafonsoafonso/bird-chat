import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {

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

  final lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo a diam sollicitudin tempor id eu. Libero justo laoreet sit amet cursus. Morbi enim nunc faucibus a pellentesque. Quis eleifend quam adipiscing vitae. Faucibus nisl tincidunt eget nullam non nisi est sit amet. Dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Cum sociis natoque penatibus et magnis dis parturient montes nascetur. Viverra justo nec ultrices dui sapien eget mi.\nConvallis convallis tellus id interdum velit laoreet. Urna nunc id cursus metus aliquam. Facilisis magna etiam tempor orci eu lobortis. Nec ullamcorper sit amet risus nullam. Facilisi cras fermentum odio eu feugiat pretium. Convallis a cras semper auctor neque vitae tempus quam pellentesque. At erat pellentesque adipiscing commodo elit. Eu volutpat odio facilisis mauris sit amet massa. Egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Et ultrices neque ornare aenean euismod elementum nisi quis eleifend. Odio tempor orci dapibus ultrices. Interdum posuere lorem ipsum dolor sit. Volutpat blandit aliquam etiam erat velit scelerisque in. Pharetra sit amet aliquam id diam maecenas ultricies mi eget.";

  Widget _buildMessageCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Text("username", style: TextStyle(

              fontWeight: FontWeight.bold,
            ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Text("$lorem"),
          )
        ],
      ),
    );
  }

  List<Widget> _buildMessages() {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(_buildMessageCard());
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        children: _buildMessages(),
      ),
    );
  }
}