import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class TimePill extends StatelessWidget {
  final String title;
  final String subtitle;

  const TimePill({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 7,
        height: MediaQuery.of(context).size.width / .4,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0.9),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: AppColors.light),
            ),
            Text(
              subtitle,
              style: TextStyle(color: AppColors.light),
            )
          ],
        ));
  }
}
