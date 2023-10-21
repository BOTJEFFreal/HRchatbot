import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../functions/server.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String) onSendMessage;

  const ChatTextField({
    Key? key,
    required this.textEditingController,
    required this.onSendMessage,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    void _onSendMessage(String message) async {
      try {
        var response = await http.post(Uri.parse('http://127.0.0.1:8000/chatapp/reply/'), body: {
          'sender_id': '2',
          'content': 'Hi how are you new message',
        });
        if (response.statusCode == 200) {
          print('Request successful');
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (error) {
        print('Error: $error');
      }

    }

    void _onPressed() {
      if (widget.textEditingController.text != "") {
        // _onSendMessage(widget.textEditingController.text);
        sendPostRequest(widget.textEditingController.text);
        widget.onSendMessage(widget.textEditingController.text);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: TextField(
              controller: widget.textEditingController,
              decoration: const InputDecoration(
                labelText: 'Enter your text',
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Set border color here
                ),
              ),
            ),
          ),
        ),
        Container(
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: _onPressed,
          ),
        )
      ],
    );
  }
}
