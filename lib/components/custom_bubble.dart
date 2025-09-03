import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  final text;
  const CustomBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/mm1.png"),
              backgroundColor: Constants.grey,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),

                Text("you", style: TextStyle(color: Constants.white)),

                SizedBox(height: 5),
                Container(
                  height: s.height * 0.60,
                  width: s.width * 0.60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Constants.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(text, style: TextStyle(color: Constants.white)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
