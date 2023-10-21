import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendMessageToServer(String message) async {
  final String apiUrl = 'https://example.com/api'; // Replace with your API URL

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, dynamic> data = {
    'message': message,
  };

  final http.Response response = await http.post(
    apiUrl,
    headers: headers,
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print('Message sent successfully');
  } else {
    throw Exception('Failed to send message to server');
  }
}
