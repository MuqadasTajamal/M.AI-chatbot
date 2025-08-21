import 'dart:convert';
import 'package:final_project/model/chatbot_model.dart';
import 'package:final_project/model/chatbot_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotProvider extends ChangeNotifier {
  TextEditingController controller = TextEditingController();

  ChatbotModel? chatresposed;

  sendMessage() async {
    final headers = {
      'Content-Type': 'application/json',
      'X-goog-api-key': 'AIzaSyDfZeb-LuJykgfrg26HbujSwAJ_9qqYEyA',
    };

    final body = json.encode({
      "contents": [
        {
          "parts": [
            {"text": controller.text},
          ],
        },
      ],
    });

    Uri Url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent",
    );

    var data = await http.post(Url, headers: headers, body: body);
    if (data.statusCode == 200) {
      var resposed = jsonDecode(data.body);
      chatresposed = ChatbotModel.fromJson(resposed);
      print(data.body);

      notifyListeners();
    }
  }
}
