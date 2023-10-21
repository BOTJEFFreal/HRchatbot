import 'package:flutter/material.dart';
import 'package:hrchatbot/pages/chatPage.dart';
import 'package:hrchatbot/pages/form.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RatingForm(),
    );
  }
}

