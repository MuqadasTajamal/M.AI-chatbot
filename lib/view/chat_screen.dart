import "package:final_project/components/custom_bubble.dart";
import "package:final_project/components/custom_bubble1.dart";
import "package:final_project/components/custom_textfeild.dart";
import "package:final_project/components/custom_textfeild1.dart";
import "package:final_project/controller/provider/chatbot_provider.dart";
import "package:final_project/utils/constants.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.AppBar,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [Icon(Icons.more_vert)],
        title: Expanded(
          child: Row(
            children: [
              Flexible(
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Constants.black,
                  child: Image.asset("images/mai2.png", fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 5),
              Flexible(child: Text("M.AI ")),
              SizedBox(width: 5),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        shape: Border.all(color: Constants.boder),
      ),
      body: Container(
        height: s.height,
        width: s.width,
        color: Constants.white,
        child: Consumer<ChatbotProvider>(
          builder: (context, Provider, child) {
            return Column(
              children: [
                if (Provider.allMessages.isNotEmpty)
                  Container(
                    height: s.height * 0.70,
                    width: s.width * 0.70,
                    // color: Constants.black,
                    child: ListView.builder(
                      itemCount: Provider.allMessages.length,
                      itemBuilder: (context, index) {
                        return CustomBubble1(
                          text:
                              Provider
                                  .chatResposed!
                                  .candidates[0]
                                  .content
                                  .parts[0]
                                  .text,
                        );
                      },
                    ),
                  ),
                if (Provider.allMessages.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 500,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Outline (Stroke)
                              Text(
                                'Welcome to M.AI',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  foreground:
                                      Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 3
                                        ..color = Constants.blackmight,
                                ),
                              ),
                              // Gradient Fill
                              Text(
                                'Welcome to M.AI',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  foreground:
                                      Paint()
                                        ..shader = LinearGradient(
                                          colors: [
                                            Constants.blackmight,
                                            Constants.boder,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(
                                          Rect.fromLTWH(0, 0, 300, 70),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Constants.black,
                          child: Image.asset(
                            "images/mai2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.only(bottom: 40),
                          width: s.width * 0.60,
                          child: CustomTextfeild1(Provider: Provider),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                if (Provider.allMessages.isNotEmpty)
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      width: s.width * 0.60,
                      child: CustomTextfeild1(Provider: Provider),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
