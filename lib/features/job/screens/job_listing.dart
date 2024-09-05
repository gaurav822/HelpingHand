import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/core/app_style.dart';

import '../../../core/app_color.dart';
import '../../../data/repositories/dummy_data/dummy_data.dart';
import '../../service/screens/service_application_form.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> jobs =  DummyData().getLocalJobs();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Local Jobs",style: style20Bold(),),
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
              children: jobs.map((job) {
                return Container(
                  child: JobCard(job), // Assuming taskProgressFrame takes a task as input
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget JobCard(Map<String,String> job){
    return GestureDetector(
      onTap: (){
        Get.to(()=> const ServiceApplicationForm(serviceType:"job"));

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
              Text(job["jobRole"]!,style: style20Bold(),),
              SizedBox(height: 4,),
              Text(job["companyName"]!,style: style16Medium(),),
              SizedBox(height: 3,),
              Text(job["jobLocation"]!),

              SizedBox(height: 20,),
              Text(job["datePosted"]!,style: style16Medium(color: ThemeColor.colorPrimary),)
            ],
          ),
        ),
      ),
    );

  }
}
