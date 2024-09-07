import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/chat_request.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';


class ExpertChatScreen extends StatelessWidget {
  const ExpertChatScreen({
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
    return Scaffold(
      body: SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // for(int i=0;i<10;i++)
                            // const ChatRequestWidget()
                          ],
                        ),
                      )
                  ),
                ),
              ),
    );
  }
}
