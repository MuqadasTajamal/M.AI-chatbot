import 'package:final_project/controller/provider/chatbot_provider.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomsendButton extends StatelessWidget {
  final ChatbotProvider? provider;
  const CustomsendButton({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Constants.black,
        // color: Colors.amber,
        border: Border.all(),
      ),
      child:
          provider!.isLoading
              ? Center(
                child: Container(
                  height: 20,
                  width: 15,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Constants.white),
                    backgroundColor: Constants.whiteLight,
                  ),
                ),
              )
              : Icon(Icons.arrow_upward, color: Constants.whiteLight),
    );
  }
}
