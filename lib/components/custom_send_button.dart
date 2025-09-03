import 'package:final_project/controller/provider/chatbot_provider.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomSendButton extends StatelessWidget {
  final ChatbotProvider? provider;
  const CustomSendButton({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constants.primary,
        border: Border.all(),
      ),
      child:
          provider!.isLoading
              ? Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Constants.grey),
                    backgroundColor: Constants.secondary,
                  ),
                ),
              )
              : Icon(Icons.arrow_forward, color: Constants.secondary),
    );
  }
}
