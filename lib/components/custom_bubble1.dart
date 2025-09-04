import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBubble1 extends StatelessWidget {
  final text;
  const CustomBubble1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleAvatar(
              //   // backgroundImage: AssetImage("images."),
              //   child: Image.asset("images/mai2.png", fit: BoxFit.cover),
              // ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Constants.black,
                child: Image.asset("images/mai2.png", fit: BoxFit.cover),
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("you"),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        color: Constants.greylight,
                      ),
                      child: Text(
                        text,
                        style: TextStyle(color: Constants.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // return Row(
    //   mainAxisSize: MainAxisSize.min,

    //   //         : MainAxisAlignment.start,
    //   // crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     CircleAvatar(
    //       child: Image.asset("images/mai2.png", fit: BoxFit.cover),
    //       // backgroundImage: AssetImage("images/mai2.png"),
    //       backgroundColor: Constants.blackmight,
    //     ),
    //     SizedBox(width: 20),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         // SizedBox(width: 10),
    //         Text(
    //           "M.AI",
    //           style: TextStyle(
    //             // color: Constants.black,
    //             fontSize: 20,
    //             fontFamily: "fonts/Mont",
    //             fontWeight: FontWeight.w900,
    //           ),
    //         ),

    //         SizedBox(height: 5),
    //         Container(
    //           // height: s.width < 600 ? s.height : s.height * 0.60,
    //           // width: s.width < 600 ? s.width : s.width * 0.60,
    //           padding: EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //             // color: Constants.secondary,
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           child: Text(
    //             text,
    //             style: TextStyle(
    //               // color: Constants.black,
    //               fontSize: 15,
    //               fontFamily: "fonts/Robo",
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
