import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:progress_line/progress_line.dart';

import '../../../common/widgets/expert_widget.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../core/app_color.dart';
import '../../../core/app_style.dart';


class HomeScreen extends StatefulWidget {
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
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _value = 0.0;
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
                            for (int i=0;i<2;i++)
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                  child: taskProgressFrame()),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Recommended Experts for You",style: style16Medium(),),
                        SizedBox(height: 20,),

                        for(int i=0;i<3;i++)
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  ExpertWidget(),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text("Job Expert",style: style10(),),
                                  )
                                ],
                              )),


                      ],
                    ),]
                  ),
                ),
              ),
            )));
  }

  Widget taskProgressFrame(){
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        color: const Color(0xFFE3EEDA),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/profile.jpg",height: 70,width: 70,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                    child: Text("Tax File Number (TFN",style: style14Semibold(),)),
                Row(

                  children: [
                    ProgressLineWidget(
                      end: Text("${(_value * 100).toStringAsFixed(0)}%"),
                      percent: 0.8,
                      lineWidth: 20,
                      lineColors: const [
                        Colors.green,
                      ],
                      bgColor: Colors.grey.withOpacity(0.4),
                      innerPadding: const EdgeInsets.all(20),
                      width: 100,
                      height: 60,
                      callback: (value) {
                        setState(() {
                          _value = value;
                        });
                      },

                    ),
                    SizedBox(width: 20,),
                    Text("View Details",style: style14Medium(),)
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
