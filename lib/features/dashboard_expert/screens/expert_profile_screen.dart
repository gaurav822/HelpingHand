import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/core/colors/light_theme_color.dart';
import 'package:helpinghand/data/repositories/authentication/authentication_repository.dart';
import 'package:helpinghand/features/authentication/screens/login/login_screen.dart';
import 'package:helpinghand/features/dashboard/controllers/profile_controller.dart';

import '../../../Utils/Validator/FormValidator.dart';
import '../../../common/text_strings.dart';
import '../../../common/widgets/field_widget.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../core/app_color.dart';
import '../../../core/app_style.dart';


class ExpertProfileScreen extends StatelessWidget {
  const ExpertProfileScreen({
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
    final controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child:  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/profile.jpg",height: 100,width: 100,)),
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(Icons.camera_alt),
                          ),
      
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Gaurav Dahal",style: style20Medium(),),
      
                      SizedBox(height: 10,),
                      Text("Tax Specialist",style: style14(),),
                      SizedBox(height: 10,),
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/star.png"),
                          SizedBox(width: 10,),
                          Text("5/5"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Text("About me",style: style16Bold(),),
                  SizedBox(height: 10,),

                  Text(
                      "I am a seasoned professional with over 5 years of experience in helping international students with [specific services like TFN/ABN setup, resume writing, etc.]"),

                  SizedBox(height: 40,),
                  Text("Compliance Documents",style: style16Bold(),),

                  SizedBox(height: 20,),
                  ComplianceCard("Tax File Number (TFN)",true),

                  ComplianceCard("Visa Status",true),

                  ComplianceCard("Real Estate Certificate",false),


                  SizedBox(height: 40,),
                  Text("Feedback/Reviews",style: style16Bold(),),


                  SizedBox(height: 20,),
                  Text("Rida Zahoor : Great service!"),
                  SizedBox(height: 5,),
                  Image.asset("assets/star.png"),

                  SizedBox(height: 20,),
                  Text("Bishal : Got my TFN ready quickly!"),
                  SizedBox(height: 5,),
                  Image.asset("assets/star.png"),

                  SizedBox(height: 100,),



                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // This makes the button rectangular with sharp corners
                            ),
                          ),
                          onPressed: (){
                            AuthenticationRepository.instance.logout();
                            Get.offAll(()=>const LoginScreen());
                            Fluttertoast.showToast(msg: "Logout Successful");
                          }, child: const Text("Logout")),
                    ),
                  ),

                  SizedBox(height: 50,)

                ],
              )
          ),
        ),
      
      ),
    );
  }


  Widget ComplianceCard(String docName,bool isVerified){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        color: Color(0xFFE3EEDA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(docName,style: style20Bold(),),

                SizedBox(width: 20,),
                
                SvgPicture.asset("assets/icons/svgs/doc.svg")
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(isVerified?"Verified":"Disproved",style: style16Medium(),),
                SizedBox(width: 20,),
                isVerified?Image.asset("assets/icons/verified.png",height: 40,width: 40,): SvgPicture.asset("assets/icons/svgs/disapproved.svg")
              ],
            )
          ],
        ),
      ),
    );

  }
}
