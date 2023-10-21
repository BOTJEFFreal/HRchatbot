import 'dart:convert';
import 'package:http/http.dart' as http;

void sendPostRequest( String message) async {
  var request = http.MultipartRequest('POST', Uri.parse('https://hr-chatbot-3sh8.onrender.com/chatapp/reply/'));
  request.fields.addAll({
    'sender_id': '2',
    'content': message
  });


  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}