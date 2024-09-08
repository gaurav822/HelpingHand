
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpinghand/common/widgets/title_medium.dart';

import '../login/login_screen.dart';
import '../signup/registration_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Register',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Colors.green,
      ),
      skipTextButton: const Text('Skip'),
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      },
      trailingFunction: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) =>  const LoginScreen(),
          ),
        );
        final storage = GetStorage();
        storage.write('isFirstTime', false);
      },
      trailing: const Text('Login'),
      background: [
        Container(
            margin:const EdgeInsets.only(top: 20,left: 20),
            child: Center(child: Image.asset('assets/onboarding_1.png',height: 300,width: 300,fit: BoxFit.cover,),)),
        Container(
            margin:const EdgeInsets.only(top: 20),
            child: Center(child: Image.asset('assets/onboarding_2.png',height: 400,width: 400,fit: BoxFit.fitHeight,),)),
        Container(
            margin:const EdgeInsets.only(top: 20),
            child: Center(child: Image.asset('assets/onboarding_3.png',height: 300,width: 400,fit: BoxFit.fitHeight,),)),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:  Column(
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              const TitleMedium(text: "Welcome to Helping Hand"),

              const SizedBox(height: 50,),

              Flexible(child: Text("Helping Hand supports international students in Australia. Access essential services, job opportunities, and expert guidance with ease.",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade600),))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              const TitleMedium(text: "Discover Essential Services"),

              const SizedBox(height: 50,),

              Flexible(child: Text("Explore services for TFN, ABN, banking, police checks, and housing. Our verified  experts are here to assist you.",textAlign: TextAlign.center,style:TextStyle(color: Colors.grey.shade600)))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child:  Column(
            children: <Widget>[
              const SizedBox(
                height: 400,
              ),
              const TitleMedium(text: "Find Your Perfect Job"),

              const SizedBox(height: 50,),

              Flexible(child: Text("Access job opportunities tailored to your profile. Apply directly and get support from our admin and experts in your job hunt.",textAlign: TextAlign.center,style:TextStyle(color: Colors.grey.shade600)))
            ],
          ),
        ),
      ],
    );
  }
}
