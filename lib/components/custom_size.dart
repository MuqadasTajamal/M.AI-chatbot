import 'package:flutter/material.dart';

class HSize extends StatelessWidget {
  var width;
  HSize({this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class VSize extends StatelessWidget {
  var height;
  VSize({this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
