import 'package:final_project/components/custom_send_button.dart';
import 'package:final_project/controller/provider/chatbot_provider.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextfeild extends StatelessWidget {
  final ChatbotProvider? Provider;
  const CustomTextfeild({super.key, required this.Provider});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (s) {
        Provider!.sendMessage();
      },
      onChanged: (a) {
        Provider!.isSendButtonVisible();
      },
      cursorColor: Constants.white,
      style: const TextStyle(color: Constants.primary),

      controller: Provider!.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.secondary),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.secondary),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hintText: "Type your message...",
        hintStyle: const TextStyle(color: Constants.white),
        border: InputBorder.none, // 🌟 CLEAN LOOK
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),

        suffixIcon:
            Provider!.isShowButton
                ? InkWell(
                  onTap: () {
                    Provider!.sendMessage();
                  },
                  child: CustomSendButton(provider: Provider),
                )
                : SizedBox(),
      ),
    );
  }
}
