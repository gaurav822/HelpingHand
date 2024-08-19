import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final bool isNext;
  const NextButton({super.key, this.onPressedCallback, this.isNext=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          elevation: 0,
        ),
        onPressed: onPressedCallback,
        child: Transform.rotate(
          angle: isNext ? 0 : 3.14159, // 0 radians for "next", π radians for "right"
          child: SvgPicture.asset("assets/icons/svgs/next_arrow.svg"),
        ),
      ),
    );
  }
}
