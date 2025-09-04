// import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:final_project/model/chatbot_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatbot1Provider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  List allMessages = [];

  ChatbotModel? chatResposed;
  bool isShowButton = false;
  bool isLoading = false;

  isShowLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  isSendButtonVisible() {
    if (controller.text.isEmpty) {
      isShowButton = false;
    } else {
      isShowButton = true;
    }
    notifyListeners();
  }

  sendMessage() async {
    // allMessages.add("Welco.me");
    controller.clear();
    isShowLoading(true);
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
      chatResposed = ChatbotModel.fromJson(resposed);
      allMessages.add(chatResposed);

      isSendButtonVisible();
      isShowLoading(false);

      // print(data.body);
      notifyListeners();
    }
  }
}
