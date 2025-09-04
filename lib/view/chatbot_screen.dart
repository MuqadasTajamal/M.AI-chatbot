// // class ChatbotScreen extends StatelessWidget {
// //   const ChatbotScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     var s = MediaQuery.of(context).size;

// //     return Scaffold(
// //       appBar: AppBar(
// //         toolbarHeight: 70,
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: Icon(Icons.arrow_back),
// //           color: Colors.white,
// //         ),
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [Image.asset("images/mai2.png", height: 200, width: 150)],
// //         ),
// //         backgroundColor: Colors.grey.shade900,
// //         actions: [
// //           InkWell(
// //             onTap: () {
// //               // Navigator.push(
// //               //   context,
// //               //   MaterialPageRoute(builder: (context) => MyWidget()),
// //               // );
// //             },
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Icon(Icons.arrow_upward, color: Colors.white, size: 25),
// //                   SizedBox(width: 5),
// //                   Text(
// //                     "share",
// //                     style: TextStyle(color: Colors.white, fontSize: 16),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SizedBox(width: 10),
// //           IconButton(
// //             onPressed: () {},
// //             icon: Icon(Icons.more_horiz_rounded),
// //             color: Colors.white,
// //             // size: 25,
// //           ),
// //           SizedBox(width: 5),
// //         ],
// //       ),

// //       body: Consumer<ChatbotProvider>(
// //         builder: (context, provider, child) {
// //           return Stack(
// //             children: [
// //               // ✅ Background black
// //               Container(
// //                 height: s.height,
// //                 width: s.width,
// //                 color: Colors.black, // 🌟 CHANGED
// //               ),

// //               // ✅ Scrollable content
// //               SingleChildScrollView(
// //                 padding: EdgeInsets.only(
// //                   top: provider.chatresposed != null ? 20 : 100,
// //                   bottom: 80,
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     if (provider.chatresposed == null)
// //                       Center(
// //                         child: const Text(
// //                           "😊 Welcome to M.AI!\nType a message below to start.",
// //                           style: TextStyle(color: Colors.grey, fontSize: 18),
// //                           textAlign: TextAlign.center,
// //                         ),
// //                       )
// //                     else
// //                       Text(
// //                         provider
// //                             .chatresposed!
// //                             .candidates[0]
// //                             .content
// //                             .parts[0]
// //                             .text,
// //                         style: const TextStyle(
// //                           fontSize: 20,
// //                           color: Colors.white, // 🌟 CHANGED
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                   ],
// //                 ),
// //               ),

// //               // ✅ Glassmorphic TextField
// //               Positioned(
// //                 bottom: 20,
// //                 left: 10,
// //                 right: 10,
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(15),
// //                   child: BackdropFilter(
// //                     filter: ImageFilter.blur(
// //                       sigmaX: 10,
// //                       sigmaY: 10,
// //                     ), // 🌟 GLASS EFFECT
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.white.withOpacity(0.1), // 🌟 GLASS LOOK
// //                         borderRadius: BorderRadius.circular(15),
// //                         border: Border.all(color: Colors.white24),
// //                       ),
// //
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// import 'dart:ui'; // 🌟 NEW: Glass effect ke liye

// import 'package:final_project/components/custom_textfeild.dart';
// import 'package:final_project/controller/provider/chatbot_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // import 'package:google_fonts/google_fonts.dart';
// class ChatbotScreen extends StatelessWidget {
//   const ChatbotScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       // backgroundColor: const Color.fromARGB(255, 250, 183, 206),
//       body: Consumer<ChatbotProvider>(
//         builder: (context, provider, child) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 if (provider.chatresposed != null)
//                   Text(
//                     provider.chatresposed!.candidates[0].content.parts[0].text,
//                   ),
//                 Spacer(),
//                 CustomTextfeild(Provider: provider),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:final_project/components/custom_bubble.dart';
import 'package:final_project/components/custom_textfeild.dart';
import 'package:final_project/controller/provider/chatbot_provider.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            transform: GradientRotation(0.5),
            end: Alignment.bottomRight,
            colors: [
              // Constants.secondarylight,
              // Constants.primary,
              Constants.whiteLight,
              Constants.white,
            ],
          ),
        ),
        child: Consumer<ChatbotProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // if(controller.text.isEmpty)
                  Container(
                    height: s.height * 0.70,
                    width: s.width * 0.70,
                    // color: Constants.black,
                    child: ListView.builder(
                      itemCount: provider.allMessages.length,
                      itemBuilder: (context, index) {
                        return CustomBubble(
                          text:
                              provider
                                  .chatResposed!
                                  .candidates[0]
                                  .content
                                  .parts[0]
                                  .text,
                        );
                      },
                    ),
                  ),

                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    width: s.width * 0.60,
                    child: CustomTextfeild(Provider: provider),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
