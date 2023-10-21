import 'dart:convert';
import 'package:http/http.dart' as http;

void sendPostRequest() async {
  final apiUrl = 'http://127.0.0.1:8000/chatapp/reply/';

  // Define the request body
  var requestBody = {
    'sender_id': '1', // Replace with the actual sender ID
    'content': 'Hello, this is a sample message.', // Replace with the actual message content
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 201) {
    print('Message sent successfully');
    print('Response: ${response.body}');
  } else {
    print('Error sending message: ${response.statusCode}');
  }
}

void main() {
  sendPostRequest();
}
