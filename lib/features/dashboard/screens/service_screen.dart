import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/accomodation/screens/accomodation_listing_screen.dart';
import 'package:helpinghand/features/job/screens/job_listing.dart';

import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';
import '../../service/screens/service_request_screen.dart';


class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({
    super.key,
    required this.menuScreenContext,
    required this.onScreenHideButtonPressed,
    this.hideStatus = false,
  });

  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding:
                const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                      children: [

                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                              onTap: (){
                                Get.to(()=>const ServiceRequestScreen(serviceName: "TFN",));
                              },
                              child: IndividualService("Tax File Number (TFN)","assets/tfn.jpg")),
                          const SizedBox(height: 30,),
                          InkWell(
                            onTap: (){
                              Get.to(()=>const ServiceRequestScreen(serviceName: "ABN",));
                            },
                              child: IndividualService("Australia B. Number (ABN)","assets/abn.jpg")),
                          const SizedBox(height: 30,),
                          InkWell(
                            onTap: (){
                              Get.to(()=>const ServiceRequestScreen(serviceName: "Bank Setup",));
                            },
                              child: IndividualService("Bank Setup","assets/bank.jpg")),
                          const SizedBox(height: 30,),
                          InkWell(
                            onTap: (){
                              Get.to(()=>const ServiceRequestScreen(serviceName: "Police Report",));

                            },
                              child: IndividualService("Police Check Report","assets/police.jpg")),
                          const SizedBox(height: 30,),
                          InkWell(
                            onTap: (){
                              Get.to(()=>const JobListingScreen());
                            },
                              child: IndividualService("Jobs","assets/job.jpg")),
                          const SizedBox(height: 30,),
                          InkWell(
                              onTap: (){
                                Get.to(()=>const AccomodationListingScreen());
                              },
                              child: IndividualService("Accomodation","assets/accomodation.jpg")),

                        ],
                      ),]
                  ),
                ),
              ),
            )));
  }

  Widget IndividualService(String name,String asset){
    return Container(
      color: Color(0xFFE3EEDA),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(asset),
            Text(name)
          ],
        ),
      ),
    );
  }
}
