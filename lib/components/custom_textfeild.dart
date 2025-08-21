// import 'package:flutter/material.dart';


// class CustomTextfeild extends StatelessWidget {
//   const CustomTextfeild({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  TextField(
//                         style: TextStyle(color: Color(0xff002229)),
//                         controller: provider.controller,
//                         decoration: InputDecoration(
//                           suffix: IconButton(
//                             onPressed: () {
//                               ChatbotProvider p =
//                                   context.read<ChatbotProvider>();
//                               p.sendMessage();
//                             },
//                             icon: Icon(Icons.send, color: Colors.black),
//                           ),
//                         ),
//                       );
//   }
// }