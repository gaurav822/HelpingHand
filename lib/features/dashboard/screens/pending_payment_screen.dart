import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helpinghand/common/widgets/submit_button.dart';
import 'package:helpinghand/features/authentication/controllers/signup/verify_account_controller.dart';
import 'package:helpinghand/features/authentication/screens/login/login_screen.dart';
import 'package:helpinghand/features/dashboard/screens/student_dashboard.dart';
import 'package:path/path.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';

class PaymentPendingScreen extends StatefulWidget {
  const PaymentPendingScreen({super.key});

  @override
  State<PaymentPendingScreen> createState() => _PaymentPendingScreenState();
}

class _PaymentPendingScreenState extends State<PaymentPendingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyAccountController());
    return Material(
      child: SafeArea(
        child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Hang Tight!", style: style20Bold(),)),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0), // Optional: Add padding for better alignment
                    child: Text(
                      "We are on the way to verify your payment!",
                      style: style14(),
                      textAlign: TextAlign.center, // Center align the text within the Text widget
                    ),
                  ),
      
                  const SizedBox(height: 40,),
                  Image.asset('assets/pending_payment.png',height: 200,),
                  const SizedBox(height: 80,),
                  SubmitButton(text: "Continue", onPressedCallback: () =>  Get.offAll(StudentDashboard(menuScreenContext:Get.context!,initialIndex: 0,))),
      
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
