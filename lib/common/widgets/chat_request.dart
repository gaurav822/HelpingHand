import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_style.dart';

class ChatRequestWidget extends StatelessWidget {
  const ChatRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/profile.jpg", height: 50, width: 50,)),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gaurav Dahal", style: style16Semibold(),),
                SizedBox(height: 3,),
                Text("Bank Setup")

              ],
            ),

            Spacer(),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // This makes the button rectangular with sharp corners
                  ),
                ),
                onPressed: () {}, child: Text("Accept"))

          ],
        ),
      );
    }
  }
