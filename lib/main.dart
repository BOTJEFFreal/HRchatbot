import 'package:flutter/material.dart';
import 'package:hrchatbot/components/ChatTextField.dart';

import 'functions/ReceivedMessage.dart';
import 'functions/SentMessage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

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

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Container(
              height: height * 0.78,
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
        ));
  }
}
