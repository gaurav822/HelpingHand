import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/chat_request.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';


class ExpertHomeScreen extends StatelessWidget {
  const ExpertHomeScreen({
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
                  child: ListView(
                      children: [Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text("Weclome, John",style: style16Medium(),),
                              const SizedBox(width: 20,),
                              Image.asset("assets/welcome_bot.jpg")
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("Thank you for being a part of Helping Hand. Manage your services, connect with students, and grow your professional network.",

                            style: style14(),textAlign: TextAlign.left,),

                          const SizedBox(height: 30,),

                          Text("Your Active Tasks",style: style16Medium(),),
                          SizedBox(height: 10,),
                          Column(
                            children: [
                              // for (int i=0;i<2;i++)
                                // Container(
                                //     margin: EdgeInsets.only(bottom: 20),
                                //     child: SvgPicture.asset("assets/frame.svg")),

                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("New Student Request",style: style16Medium(),),
                          SizedBox(height: 20,),
                          // ChatRequestWidget(),

                          SizedBox(height: 20,),
                          Text("Recent Notifications",style: style16Medium(),),


                        ],
                      ),]
                  ),
                ),
              ),
            )));
  }

}
