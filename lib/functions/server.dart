import 'dart:convert';
import 'package:http/http.dart' as http;

void sendPostRequest(String message) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://hr-chatbot-3sh8.onrender.com/chatapp/reply/'));
  request.fields.addAll({'sender_id': '2', 'content': message});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void sendPostForm(List<int> values) async {
 
  var request = http.MultipartRequest('POST', Uri.parse('https://hr-chatbot-3sh8.onrender.com/chatapp/number-output/'));
  request.fields.addAll({
  'sender_id': '2',
  'answer1': values[0].toString(),
  'answer2': values[1].toString(),
  'answer3': values[2].toString(),
  'answer4': values[3].toString(),
  'answer5': values[4].toString()
  });


  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}
