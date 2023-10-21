import 'package:flutter/material.dart';

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

    void _onPressed() {
      if(widget.textEditingController.text!=""){
        widget.onSendMessage(widget.textEditingController.text);
      }
    }


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.85,
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 2, bottom: 16, left: 8),
            child: TextField(
              controller: widget.textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter your text',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Set border color here
                ),
              ),
            ),
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: _onPressed,
          ),
        )
      ],
    );
  }
}
