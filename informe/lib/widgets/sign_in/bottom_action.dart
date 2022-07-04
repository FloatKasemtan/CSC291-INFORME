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
              text: 'Sign up Now',
              style: const TextStyle(
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ),
        RichText(
          text: TextSpan(
              text: 'Forgot Password?',
              style: const TextStyle(color: Colors.white),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ),
      ],
    );
  }
}
