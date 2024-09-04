import 'package:flutter/cupertino.dart';

import '../../core/app_style.dart';

class ExpertWidget extends StatelessWidget {
  const ExpertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/profile.jpg",height: 50,width: 50,)),

        const SizedBox(width: 20,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gaurav Dahal"),
            SizedBox(height: 5,),
            Image.asset("assets/star.png")
          ],
        ),
      ],
    );
  }
}
