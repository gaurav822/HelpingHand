import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard/screens/chat_screen.dart';
import 'package:helpinghand/features/service/controllers/service_controller.dart';
import 'package:helpinghand/features/service/models/service.dart';
import '../../../common/widgets/expert_widget.dart';
import '../../../core/app_style.dart';

class ServiceRequestScreen extends StatelessWidget {
  final Service service;
  final String reqId;

  const ServiceRequestScreen({super.key, required this.service, required this.reqId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("${service.typename} Expert", style: style20Bold()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // The back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.all(20),
          child: controller.getExpertsByServiceType(service.typename).isNotEmpty
              ? Column(
            children: controller.getExpertsByServiceType(service.typename).map((expert) {
              // Find the matching service request with this expert ID
              final matchingServiceRequest = controller.serviceRequests
                  .firstWhereOrNull((service) =>
              service.serviceRequest != null &&
                  service.serviceRequest!.expertId.id == expert.id);

              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    ExpertWidget(expertListModel: expert),
                    const Spacer(),
                    if (matchingServiceRequest != null)
                    // If the status is "In Progress", show "Chat", else "Request Sent"
                      (matchingServiceRequest.status == "In Progress")
                          ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rectangular with sharp corners
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => ChatScreen(
                              userName:
                              "${expert.firstname} ${expert.lastname}"));
                        },
                        child: const Text("Chat"),
                      )
                          : const Text("Request Sent")
                    else
                      InkWell(
                        onTap: () {
                          controller.sendServiceRequest(expert.id, reqId);
                        },
                        child: Image.asset("assets/icons/request.png"),
                      ),
                  ],
                ),
              );
            }).toList(),
          )
              : const Center(
            child: Text("No experts Found"),
          ),
        );
      }),
    );
  }
}
