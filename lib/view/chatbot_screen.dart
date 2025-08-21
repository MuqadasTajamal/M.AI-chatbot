import 'dart:ui'; // 🌟 NEW: Glass effect ke liye

import 'package:final_project/controller/provider/chatbot_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        color: Colors.black,
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatbotScreen()),
              );
            },
            child: Container(
              height: 300,
              width: 400,
              child: Image.asset("images/mai2.png", fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Row(
          children: [Image.asset("images/mai2.png", height: 150, width: 150)],
        ),
        backgroundColor: Colors.grey.shade900,
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyWidget()),
              // );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_upward, color: Colors.white, size: 25),
                  SizedBox(width: 5),
                  Text("share", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz_rounded),
            color: Colors.white,
            // size: 25,
          ),
          SizedBox(width: 5),
        ],
      ),

      body: Consumer<ChatbotProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              // ✅ Background black
              Container(
                height: s.height,
                width: s.width,
                color: Colors.black, // 🌟 CHANGED
              ),

              // ✅ Scrollable content
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 100, bottom: 80),
                child: Column(
                  children: [
                    if (provider.chatresposed == null)
                      Center(
                        child: const Text(
                          "😊 Welcome to M.AI!\nType a message below to start.",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      )
                    else
                      Text(
                        provider
                            .chatresposed!
                            .candidates[0]
                            .content
                            .parts[0]
                            .text,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white, // 🌟 CHANGED
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),

              // ✅ Glassmorphic TextField
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ), // 🌟 GLASS EFFECT
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1), // 🌟 GLASS LOOK
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        controller: provider.controller,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: const TextStyle(color: Colors.white54),
                          border: InputBorder.none, // 🌟 CLEAN LOOK
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<ChatbotProvider>().sendMessage();
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ), // 🌟 WHITE BUTTON
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
