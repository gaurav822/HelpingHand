import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_style.dart';
import 'package:helpinghand/core/colors/light_theme_color.dart';

import '../../../core/app_color.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Padding(
            padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Local Jobs",style: style20Bold(),),
            
                SizedBox(height: 20,),
            
                for(int i=0;i<5;i++)
                  JobCard(),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget JobCard(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        color: Color(0xFFE3EEDA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bartender",style: style20Bold(),),
            SizedBox(height: 4,),
            Text("Club Asfield",style: style16Medium(),),
            SizedBox(height: 3,),
            Text("Ashfield, NSW"),
      
            SizedBox(height: 20,),
            Text("2 days ago",style: style16Medium(color: ThemeColor.colorPrimary),)
          ],
        ),
      ),
    );

  }
}
