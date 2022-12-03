import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../../core/colors/colors.dart';

class ColumTextButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconsize;
  final double textize;
  ColumTextButton({
    Key? key,
    this.iconsize = 30,
    this.textize = 18,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textize),
        ),
      ],
    );
  }
}
