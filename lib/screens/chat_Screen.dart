import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff374045),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff374045),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                children: [Text('Demo...')],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Send a message',
                      suffixIcon: IconButton(
                          onPressed: () {},
                          tooltip: 'Send message',
                          icon: Icon(Icons.send))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
