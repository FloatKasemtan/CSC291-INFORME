import 'package:flutter/material.dart';
import 'package:informe/models/course.dart';

class ExpansionCard extends StatelessWidget {
  const ExpansionCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Contact",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.apply(fontWeightDelta: 2, color: Colors.black),
          ),
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        collapsedIconColor: Colors.black,
        iconColor: Colors.black,
        childrenPadding: const EdgeInsets.only(left: 12, bottom: 10, right: 12),
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Microsoft Team: ${course.lecturer!.microsoftTeams ?? '-'}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .apply(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  "Email: ${course.lecturer!.email}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .apply(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  "Tel: ${course.lecturer!.tel ?? '-'}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .apply(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
