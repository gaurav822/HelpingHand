import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/core/app_style.dart';
import 'package:helpinghand/core/colors/light_theme_color.dart';
import 'package:helpinghand/features/service/screens/service_application_form.dart';

import '../../../core/app_color.dart';
import '../../../data/repositories/dummy_data/dummy_data.dart';

class AccomodationListingScreen extends StatelessWidget {
  const AccomodationListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> accomodations =  DummyData().getLocalAccommodation();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Local Accomodation",style: style20Bold(),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // The back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: accomodations.map((accomodation) {
                return Container(
                  child: AccomodationCard(accomodation), // Assuming taskProgressFrame takes a task as input
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget AccomodationCard(Map<String,String> accomodation){
    return GestureDetector(
      onTap: (){
        Get.to(()=> const ServiceApplicationForm(serviceType:"accomodation"));

      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          color: const Color(0xFFE3EEDA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(accomodation['roomName']!,style: style20Bold(),),
                  const Spacer(),
                  Text(accomodation["rentPrice"]!,style: style14(),),

                ],
              ),
              const SizedBox(height: 3,),
              Text(accomodation['roomLocation']!),

              const SizedBox(height: 20,),
              Text(accomodation['datePosted']!,style: style16Medium(color: ThemeColor.colorPrimary),)
            ],
          ),
        ),
      ),
    );

  }
}
