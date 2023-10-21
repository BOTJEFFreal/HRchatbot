import 'package:flutter/material.dart';
import 'dart:convert';
import '../functions/server.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String) onSendMessage;
  final bool isSending;

  const ChatTextField({
    Key? key,
    required this.textEditingController,
    required this.onSendMessage,
    required this.isSending,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  void _onPressed() async {
    if (!widget.isSending && widget.textEditingController.text.isNotEmpty) {
      String sentMessage = widget.textEditingController.text;

      widget.onSendMessage(sentMessage);

      String replyMessage = await sendPostRequest(sentMessage);

      setState(() {
        widget.onSendMessage(replyMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
              enabled: !widget.isSending, // Disable the input field while sending
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
            onPressed: widget.isSending ? null : _onPressed,
            disabledColor: Colors.grey, // Change button color when disabled
          ),
        )
      ],
    );
  }
}