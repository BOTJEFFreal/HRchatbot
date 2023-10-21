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

    void _onPressed() async {
      if (widget.textEditingController.text.isNotEmpty) {
        String sentMessage = widget.textEditingController.text;

        widget.onSendMessage(sentMessage);

        String replyMessage = await sendPostRequest(sentMessage);

        setState(() {
          widget.onSendMessage(replyMessage);
        });
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
