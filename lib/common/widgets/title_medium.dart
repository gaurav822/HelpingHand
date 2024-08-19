import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_style.dart';

class TitleMedium extends StatelessWidget {
  final String text;
  const TitleMedium({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style:  style20Medium()
    );
  }
}
