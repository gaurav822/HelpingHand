import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/screens/login/login_screen.dart';
import 'package:helpinghand/features/dashboard/controllers/profile_controller.dart';

import '../../../Utils/Validator/FormValidator.dart';
import '../../../common/text_strings.dart';
import '../../../common/widgets/field_widget.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Edit Profile",style: style20Bold(),),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
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
                          SizedBox(height: 20,),
                          FieldWidget(
                            label: GTexts.firstName,
                            controller: controller.firstName,
                            validator: (value) =>
                                FormValidator.validateEmptyText(GTexts.firstName, value),
                          ),
                          const SizedBox(height: 10),
                          FieldWidget(
                            label: GTexts.lastName,
                            controller: controller.lastName,
                            validator: (value) =>
                                FormValidator.validateEmptyText(GTexts.lastName, value),
                          ),
                          const SizedBox(height: 10),
                          FieldWidget(
                            label: GTexts.uniColg,
                            controller: controller.schoolName,
                            validator: (value) =>
                                FormValidator.validateEmptyText(GTexts.school,value),
                          ),
                          const SizedBox(height: 10),
                          FieldWidget(
                            label: GTexts.schoolMail,
                            controller: controller.emailAddress,
                            validator: (value) =>
                                FormValidator.validateEmail(value),
                          ),
                          const SizedBox(height: 10),
                          FieldWidget(
                            label: GTexts.nationality,
                            controller: controller.nationality,
                            validator: (value) =>
                                FormValidator.validateEmptyText( GTexts.nationality,value),
                          ),
                          const SizedBox(height: 10),
                          FieldWidget(
                            label: GTexts.phoneNumber,
                            controller: controller.phoneNumber,
                            validator: (value) =>
                                FormValidator.validatePhoneNumber(value),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),

                          FieldWidget(
                            label: GTexts.address,
                            controller: controller.address,
                            validator: (value) =>
                                FormValidator.validateEmptyText(GTexts.address, value),
                          ),
                            const SizedBox(height: 40,),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red
                                  ),
                                    onPressed: ()async{
                                    await controller.logout();
                                    Get.offAll(()=>const LoginScreen());
                                    Fluttertoast.showToast(msg: "Logout Successful");
                                    }, child: const Text("Logout")),
                            ),
                          ),
                          const SizedBox(height: 80,)

                        ],
                      )
                  ),
                ),

    );
  }
}
