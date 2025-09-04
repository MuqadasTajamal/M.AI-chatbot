import 'package:final_project/utils/constants.dart';
import 'package:final_project/view/chat_screen.dart';
import 'package:final_project/view/chatbot_screen.dart';
import 'package:flutter/material.dart';

class ChatbotHomeScreen extends StatelessWidget {
  const ChatbotHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        color: Constants.black,
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatScreen()),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: 400,
                  child: Image.asset("images/mai2.png", fit: BoxFit.cover),
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Icon(Icons.arrow_downward, color: Constants.white),
                ),
                SizedBox(height: 5),
                Positioned(
                  top: 80,
                  left: 30,
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      border: Border.all(color: Constants.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "click hear",
                        style: TextStyle(
                          color: Constants.white,
                          fontFamily: "fonts/Mont1",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
