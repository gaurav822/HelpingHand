import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
                          Text("Welcome to Helping Hand!",style: style16Medium(),),
                          const SizedBox(width: 20,),
                          Image.asset("assets/welcome_bot.jpg")
                        ],
                        ),
                        const SizedBox(height: 20,),
                         Text("We’re here to make your journey in Australia smoother. Explore services, connect with experts, and find the support you need to thrive.",

                          style: style14(),textAlign: TextAlign.left,),

                        const SizedBox(height: 30,),

                        Text("Your Task at a Glance",style: style16Medium(),),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            for (int i=0;i<3;i++)
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                  child: SvgPicture.asset("assets/frame.svg")),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Recommended Experts for You",style: style16Medium(),),
                        SizedBox(height: 20,),

                        for(int i=0;i<5;i++)
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                              child: ExpertWidget()),


                      ],
                    ),]
                  ),
                ),
              ),
            )));
  }

  Widget ExpertWidget(){

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/profile.jpg",height: 50,width: 50,)),

        SizedBox(width: 20,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gaurav Dahal"),
            SizedBox(height: 5,),
            Image.asset("assets/star.png")
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text("Job Expert",style: style10(),),
        )
      ],
    );
  }
}
