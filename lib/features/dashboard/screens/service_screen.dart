import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/accomodation/screens/accomodation_listing_screen.dart';
import 'package:helpinghand/features/job/screens/job_listing.dart';
import 'package:helpinghand/features/service/models/service.dart';

import '../../../Utils/AssetMapper.dart';
import '../../../core/app_style.dart';
import '../../service/controllers/service_controller.dart';
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
    final serviceController = ServiceController.instance;

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
                  child:  Obx(() {
                    if (serviceController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (serviceController.services.isEmpty) {
                      return const Center(
                        child: Text("No Services found!"),
                      );
                    } else {
                      return ListView(
                        children: serviceController.services.map((service) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: individualService(service,AssetMapper(service.typename).assetPath)
                          );
                        }).toList(),
                      );
                    }
                  }),
                ),
              ),
            )));
  }

  Widget individualService(Service service,String asset){
    return InkWell(
      onTap: (){
        if(service.typename=="Jobs"){
          Get.to(()=>const JobListingScreen());
        }

        else if(service.typename=="Accomodation"){
          Get.to(()=>const AccomodationListingScreen());
        }
        else{
          Get.to(()=>ServiceRequestScreen(service: service,));
        }
      },
      child: Container(
        color: const Color(0xFFE3EEDA),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(asset),
              Column(
                children: [
                  Text(service.typename),
                  const SizedBox(height: 10,),
                  Text('(${service.description})',style: style12(),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
