import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard/screens/chat_screen.dart';
import 'package:helpinghand/features/dashboard_expert/controllers/expert_service_controller.dart';
import 'package:helpinghand/features/dashboard_expert/models/expert_service.dart';

import '../../../core/app_style.dart';
import '../../service/controllers/service_controller.dart';


class ExpertChatReqWidget extends StatelessWidget {
  final Service service;
  final StudentId tid;
  const ExpertChatReqWidget({super.key,required this.service,required this.tid});

  @override
  Widget build(BuildContext context) {
    final serviceController = Get.put(ExpertServiceController());
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/profile.jpg", height: 50, width: 50,)),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${tid.firstname} ${tid.lastname}", style: style16Semibold(),),
                const SizedBox(height: 3,),
                Text(service.serviceId.serviceTypeId.typename)
              ],
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // This makes the button rectangular with sharp corners
                  ),
                ),
                onPressed: () {
                  if(service.status!="Pending"){
                    Get.to(()=>ChatScreen(userName: "${tid.firstname} ${tid.lastname}"));
                  }
                  else{
                    if(tid.t=="Student"){
                      serviceController.acceptServiceRequest(service.id);
                    }
                  }
                }, child: Text(service.status!="Pending"?"Chat":tid.t=="Student"?"Accept":service.status))

          ],
        ),
      ),
    );
  }
}
