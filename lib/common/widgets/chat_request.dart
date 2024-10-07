import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard/screens/chat_screen.dart';
import 'package:helpinghand/features/dashboard_expert/controllers/expert_service_controller.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';

import '../../core/app_style.dart';
import '../../features/service/controllers/service_controller.dart';

class ChatRequestWidget extends StatelessWidget {
  final StudentService requestedService;
  final ExpertId tid;
  const ChatRequestWidget({super.key,required this.requestedService,required this.tid});

  @override
  Widget build(BuildContext context) {
    // final serviceController = Get.put(ServiceController());
    print(requestedService.status);
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
                  Text(requestedService.serviceTypeId.typename)
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
                    if(requestedService.serviceRequest?.status!="Pending"){
                      Get.to(()=>ChatScreen(userName: "${tid.firstname} ${tid.lastname}"));
                    }
                  }, child: Text(requestedService.serviceRequest?.status!="Pending"?"Chat":requestedService.status))

            ],
          ),
        ),
    );
    }
  }
