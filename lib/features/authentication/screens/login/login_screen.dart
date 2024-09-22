import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/screens/signup/expert_registration_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Utils/Validator/FormValidator.dart';
import '../../../../common/text_strings.dart';
import '../../../../common/widgets/field_widget.dart';
import '../../../../common/widgets/submit_button.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/colors/light_theme_color.dart';
import '../../controllers/login/login_controller.dart';
import '../signup/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Material(
      child: SafeArea(
        child:  Form(
            key: controller.loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${GTexts.welcome},",
                          style: style24Bold(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          GTexts.loginToContinue,
                          style: style14(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      FieldWidget(
                        label: GTexts.email,
                        controller: controller.emailAddress,
                        validator: (value) => FormValidator.validateEmail(value),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(
                                () => FieldWidget(
                                label: GTexts.password,
                                hasSuffix: true,
                                suffixIcon: Icon(controller.hidePassword.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye),
                                controller: controller.password,
                                validator: (value) =>
                                    FormValidator.validatePassword(value),
                                obscureText: controller.hidePassword.value,
                                onSuffixClicked: () => controller.hidePassword
                                    .value = !controller.hidePassword.value),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                      () => Checkbox(
                                      activeColor: LightThemeColor.colorPrimary,
                                      value: controller.rememberMe.value,
                                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                                ),
                                const Text( GTexts.rememberMe,)
                              ],
                            ),
                            GestureDetector(
                              // onTap: () {
                              //   Get.to(()=> const ForgetPasswordScreen());
                              // },
                              child: Text(
                                GTexts.forgetPassword,
                                style: style14(color: ThemeColor.colorPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      SubmitButton(
                        text: GTexts.login,
                        onPressedCallback: () => controller.emailAndPasswordSignIn(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          GTexts.dontHaveAcc,
                          style: style16(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.loginFormKey.currentState!.reset();
                              Get.to(() => const RegisterScreen());
                            },
                            child: Text(
                              GTexts.createStuAcc,
                              style: style16(color: ThemeColor.colorPrimary),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),

                  Center(
                    child: Text(
                      GTexts.wantToHelp,
                      style: style16(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SubmitButton(
                    text: GTexts.signUpExpert,
                    onPressedCallback: () {
                      controller.loginFormKey.currentState!.reset();
                      Get.to(() => const ExpertRegisterScreen());
                    }
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),

      ),
    );
  }
}
