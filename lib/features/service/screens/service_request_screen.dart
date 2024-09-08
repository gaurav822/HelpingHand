import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard/screens/chat_screen.dart';
import 'package:helpinghand/features/service/controllers/service_controller.dart';
import 'package:helpinghand/features/service/models/service.dart';
import '../../../common/widgets/expert_widget.dart';
import '../../../core/app_style.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class ServiceRequestScreen extends StatelessWidget {
  final Service service;
  const ServiceRequestScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceController());
    final dashController = DashboardController.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("${service.typename} Expert", style: style20Bold()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // The back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (dashController.experts.isEmpty) {
            return const Center(
              child: Text("No experts found"),
            );
          } else {
            return Column(
              children: dashController.experts.map((expert) {
                // Find the matching service request with this expert ID
                final matchingServiceRequest = controller.serviceRequests
                    .firstWhereOrNull((service) => service.expertId.id == expert.id);

                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ExpertWidget(expertListModel: expert),
                      const Spacer(),
                      if (matchingServiceRequest != null)
                      // If the status is "In Progress", show "Chat", else "Request Sent"
                        (matchingServiceRequest.status == "In Progress")
                            ?  ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // This makes the button rectangular with sharp corners
                              ),
                            ),
                            onPressed: () {
                              Get.to(()=>ChatScreen(userName: "${expert.firstname} ${expert.lastname}"));
                            }, child: const Text("Chat"))

                            : const Text("Request Sent")
                      else
                        InkWell(
                          onTap: () {
                            controller.sendServiceRequest(expert.id,service.id);
                          },
                          child: Image.asset("assets/icons/request.png"),
                        ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
        }),
      ),
    );
  }
}

