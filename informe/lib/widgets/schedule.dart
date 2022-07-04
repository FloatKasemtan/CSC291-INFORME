import 'package:flutter/material.dart';
import 'package:informe/widgets/common/under_construction.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);
  static const routeName = "/schedule";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          UnderConstruction(),
        ],
      ),
    );
  }
}
