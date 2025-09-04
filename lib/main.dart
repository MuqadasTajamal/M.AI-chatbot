import "package:final_project/controller/provider/chatbot_provider.dart";
import "package:final_project/view/chat1_screen.dart";
import "package:final_project/view/chat_screen.dart";
import "package:final_project/view/chatbot_home_screen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatbotProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "fonts/Robo1"),
        title: "MUQADAS",
        debugShowCheckedModeBanner: false,
        // home: ChatScreen(),
        // home: ChatScreen(),
        home: ChatbotHomeScreen(),
      ),
    );
  }
}


//  8


           