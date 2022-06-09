import 'package:flutter/material.dart';
import 'package:informe/widgets/get_start/next_button.dart';
import 'package:informe/widgets/get_start/text_welcome.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);
  static const routeName = "/get-start";

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161D3A),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("background.png"),
                  fit: BoxFit.cover,
                  opacity: 0.25),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextWelcome(),
                NextButton(),
              ],
            )));
  }
}
