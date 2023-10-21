import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/ChatTextField.dart';
import '../functions/ReceivedMessage.dart';
import '../functions/SentMessage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> messages = [];

  void _onSendMessage(String message) {
    setState(() {
      messages.add(message);
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        for (var message in messages) SentMessage(message: message),
                        ReceivedMessage(message: "Hi this is awesome chat bubble"),
                        // ... (other messages)
                      ],
                    ),
                  ),
                  ChatTextField(
                    textEditingController: _textEditingController,
                    onSendMessage: _onSendMessage,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}