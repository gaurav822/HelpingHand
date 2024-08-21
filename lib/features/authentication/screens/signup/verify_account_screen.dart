import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helpinghand/common/widgets/submit_button.dart';
import 'package:helpinghand/features/authentication/controllers/signup/verify_account_controller.dart';
import 'package:helpinghand/features/authentication/screens/login/login_screen.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key,this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyAccountController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Hang Tight!", style: style20Bold(),)),
                const SizedBox(height: 20,),
                Center(child: Text(email ?? '', style: style14(),)),
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Optional: Add padding for better alignment
                  child: Text(
                    "We are on the way to verify your  document! Meanwhile you need to verify your email address.",
                    style: style14(),
                    textAlign: TextAlign.center, // Center align the text within the Text widget
                  ),
                ),

                const SizedBox(height: 40,),
                Image.asset('assets/icons/verify_document.jpg'),
                const SizedBox(height: 80,),
                SubmitButton(text: "Continue", onPressedCallback: () =>  Get.offAll(const LoginScreen())),

              ],
            ),
            const Positioned(
              right: 20,
              child: InkWell(
                // onTap: () => AuthenticationRepository.instance.logout(),
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
