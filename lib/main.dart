import 'package:flutter/material.dart';
import 'package:hrchatbot/components/ChatTextField.dart';
import 'package:hrchatbot/pages/form.dart';

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
      home: RatingForm(),
    );
  }
}

