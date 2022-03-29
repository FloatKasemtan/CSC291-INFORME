import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class BottomAction extends StatelessWidget {
  const BottomAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 255,
        right: 25,
        left: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                text: 'Sign up Now',
                style: TextStyle(
                  color: Colors.white,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Login Text Clicked');
                  }),
          ),
          RichText(
            text: TextSpan(
                text: 'Forgot Password?',
                style: TextStyle(color: Colors.white),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Login Text Clicked');
                  }),
          ),
        ],
      ),
    );
  }
}