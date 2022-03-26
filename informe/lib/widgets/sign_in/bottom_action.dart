import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class BottomAction extends StatelessWidget {
  const BottomAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Login Text Clicked');
                }),
        ),
        RichText(
          text: TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Login Text Clicked');
                }),
        ),
      ],
    );
  }
}
