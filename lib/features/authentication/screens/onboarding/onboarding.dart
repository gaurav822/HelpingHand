
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpinghand/common/widgets/title_medium.dart';


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
        // Navigator.push(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) => const RegisterScreen(),
        //   ),
        // );
      },
      trailingFunction: () {
        // Navigator.push(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) =>  const LoginScreen(),
        //   ),
        // );
        final storage = GetStorage();
        storage.write('isFirstTime', false);
      },
      trailing: const Text('Login'),
      background: [
        Container(
            margin:const EdgeInsets.only(top: 20),
            child: Center(child: Image.asset('assets/onboarding_1.png',height: 400,width: 400,fit: BoxFit.fill,),)),
        Container(
            margin:const EdgeInsets.only(top: 20),
            child: Center(child: Image.asset('assets/onboarding_2.png',height: 400,width: 400,fit: BoxFit.fill,),)),
        Container(
            margin:const EdgeInsets.only(top: 20),
            child: Center(child: Image.asset('assets/onboarding_3.png',height: 400,width: 400,fit: BoxFit.fill,),)),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              TitleMedium(text: "Welcome"),

              SizedBox(height: 50,),

              Text("Explore Flexible Hourly Booking Options for Your Ideal Stay Experience",textAlign: TextAlign.center,)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              TitleMedium(text: "Get Started"),

              SizedBox(height: 50,),

              Text("Create a New Account or Log In to Unlock Exclusive Deals and Benefits",textAlign: TextAlign.center,)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              TitleMedium(text: "Tailor Your Experience"),

              SizedBox(height: 50,),

              Text("Select Your Preferences to Customize Your Perfect Hourly Stay with Us",textAlign: TextAlign.center,)
            ],
          ),
        ),
      ],
    );
  }
}
