import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Utils/Validator/FormValidator.dart';
import '../../../../common/text_strings.dart';
import '../../../../common/widgets/choose_image_widget.dart';
import '../../../../common/widgets/field_widget.dart';
import '../../../../common/widgets/submit_button.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../controllers/signup/signup_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    GTexts.studentReg,
                    style: style20Medium(),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
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
                      label: GTexts.email,
                      controller: controller.emailAddress,
                      validator: (value) =>
                          FormValidator.validateEmail(value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: GTexts.schoolMail,
                      controller: controller.schoolEmailAddress,
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
                    const SizedBox(
                      height: 30,
                    ),
                    ImagePickerWidget(
                        title: GTexts.uploadVisa,
                        onImagePicked: (value)=>{
                          setState(() {

                          })
                        }),
                    const SizedBox(height: 30,),
                    Obx(
                          () => FieldWidget(
                          label: GTexts.password,
                          hasSuffix: true,
                          suffixIcon: Icon(controller.hidePassword.value?Iconsax.eye_slash : Iconsax.eye),
                          controller: controller.password,
                          validator: (value) =>
                              FormValidator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          onSuffixClicked: () => controller.hidePassword.value = !controller.hidePassword.value

                      ),
                    ),

                    const SizedBox(height: 40),
                    SubmitButton(
                      text: GTexts.register,
                      onPressedCallback: () {
                        SignUpController.instance.signUp();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(GTexts.alreadyAcc, style: style16()),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          GTexts.signIn,
                          style: style16(color: ThemeColor.colorPrimary),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
