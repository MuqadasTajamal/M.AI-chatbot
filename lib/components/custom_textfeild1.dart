import 'package:final_project/components/custom_send_button.dart';
import 'package:final_project/components/customsend_button.dart';
import 'package:final_project/controller/provider/chatbot_provider.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextfeild1 extends StatelessWidget {
  final ChatbotProvider? Provider;
  const CustomTextfeild1({super.key, required this.Provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Constants.boder),
      ),
      child: Center(
        child: TextField(
          onSubmitted: (s) {
            Provider!.sendMessage();
          },
          onChanged: (a) {
            Provider!.isSendButtonVisible();
          },
          cursorColor: Constants.black,
          cursorWidth: 1,
          style: const TextStyle(color: Constants.black),

          controller: Provider!.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.add, color: Constants.blackmight),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Constants.grey),
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Constants.grey),
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            // ),
            hintText: "Type your message...",
            hintStyle: const TextStyle(color: Constants.grey),
            border: InputBorder.none, // 🌟 CLEAN LOOK
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),

            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.mic_none, color: Constants.blackmight),
                Provider!.isShowButton
                    ? InkWell(
                      onTap: () {
                        Provider!.sendMessage();
                      },
                      child: CustomsendButton(provider: Provider),
                    )
                    : SizedBox(),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
