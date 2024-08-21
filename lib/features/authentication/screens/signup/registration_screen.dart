import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Utils/Validator/FormValidator.dart';
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
  bool isHotelOwner = false;

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
                Center(
                  child: Text(
                    "Registration",
                    style: style20Medium(),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    FieldWidget(
                      label: "First Name",
                      controller: controller.firstName,
                      validator: (value) =>
                          FormValidator.validateEmptyText('First Name', value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: "Last Name",
                      controller: controller.lastName,
                      validator: (value) =>
                          FormValidator.validateEmptyText('Last Name', value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: "University/School/College",
                      controller: controller.schoolName,
                      validator: (value) =>
                          FormValidator.validateEmptyText('School',value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: "School Email",
                      controller: controller.emailAddress,
                      validator: (value) =>
                          FormValidator.validateEmail(value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: "Nationality",
                      controller: controller.nationality,
                      validator: (value) =>
                          FormValidator.validateEmptyText('Nationality',value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: "Phone Number",
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          FormValidator.validatePhoneNumber(value),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),

                    FieldWidget(
                      label: "Address",
                      controller: controller.address,
                      validator: (value) =>
                          FormValidator.validateEmptyText('Address', value),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ImagePickerWidget(
                        title: "Upload Visa Document",
                        onImagePicked: (value)=>{
                          setState(() {

                          })
                        }),
                    const SizedBox(height: 30,),
                    Obx(
                          () => FieldWidget(
                          label: "Password",
                          hasSuffix: true,
                          suffixIcon: Icon(controller.hidePassword.value?Iconsax.eye_slash : Iconsax.eye),
                          controller: controller.password,
                          validator: (value) =>
                              FormValidator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          onSuffixClicked: () => controller.hidePassword.value = !controller.hidePassword.value

                      ),
                    ),
                    const SizedBox(height: 10),
                    if (isHotelOwner) ...[
                      FieldWidget(
                        label: "Business Pan Number",
                        controller: controller.hotelPan,
                        validator: (value) =>
                            FormValidator.validatePanNumber('Business Pan Number', value),
                      )
                    ],
                    const SizedBox(height: 40),
                    SubmitButton(
                      text: "Register",
                      onPressedCallback: () {
                        SignUpController.instance.signUp(role: isHotelOwner?'hotel_owner':'customer');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: style16()),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Sign In",
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
