import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset("assets/undercon.png"),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Coming Soon",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Under contruction",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
