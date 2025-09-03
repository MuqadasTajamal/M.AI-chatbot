import "package:final_project/controller/provider/chatbot_provider.dart";
import "package:final_project/view/chatbot_screen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:google_fonts/google_fonts.dart';

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
        theme: ThemeData(fontFamily: "fonts/Pop"),
        title: "MUQADAS",
        debugShowCheckedModeBanner: false,
        home: ChatbotScreen(),
        // home: ChatbotScreen(),
      ),
    );
  }
}


//  8