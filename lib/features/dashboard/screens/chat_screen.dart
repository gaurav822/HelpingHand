import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.menuScreenContext,
    required this.onScreenHideButtonPressed,
    this.hideStatus = false,
  });

  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding:
                const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/no_result.jpg"),
                        const SizedBox(height: 20,),
                        Text("Chats Unavailable",style: style20Bold(),),
                        SizedBox(height: 20,),
                        Text("Please connect with the expert  first !"),


                      ],
                  )
                ),
              ),
            )));
  }
}
