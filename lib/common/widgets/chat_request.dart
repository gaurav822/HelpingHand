import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard/screens/chat_screen.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';

import '../../core/app_style.dart';

class ChatRequestWidget extends StatelessWidget {
  final RequestedService requestedService;
  const ChatRequestWidget({super.key,required this.requestedService});

  @override
  Widget build(BuildContext context) {
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
                  Text("${requestedService.expertId.firstname} ${requestedService.expertId.lastname}", style: style16Semibold(),),
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
                    if(requestedService.status=="In Progress"){
                      Get.to(()=>ChatScreen(userName: "${requestedService.expertId.firstname} ${requestedService.expertId.lastname}"));
                    }
                  }, child: Text(requestedService.status=="In Progress"?"Chat":requestedService.status))

            ],
          ),
        ),
    );
    }
  }
