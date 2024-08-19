import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_color.dart';
import 'package:helpinghand/core/app_style.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedCallback;
  const SubmitButton({super.key, required this.text, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          elevation: 0,
        ),
          onPressed: onPressedCallback,
        child: Text(text,style: style16Medium(color: ThemeColor.whiteColor),)),
    );
  }
}
