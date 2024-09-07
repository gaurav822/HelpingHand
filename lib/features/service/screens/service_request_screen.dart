import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/service/controllers/service_controller.dart';
import '../../../common/widgets/expert_widget.dart';
import '../../../core/app_style.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class ServiceRequestScreen extends StatelessWidget {
  final String serviceName;
  const ServiceRequestScreen({super.key,required this.serviceName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceController());
    final dashController = DashboardController.instance;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("$serviceName Expert",style: style20Bold(),),
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
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ExpertWidget(expertListModel: expert),
                      const Spacer(),
                          controller.serviceRequests.any((service) => service.expertId == expert.id)?const Text("Request Sent"):
                          InkWell(
                              onTap: (){
                                controller.sendServiceRequest(expert.id);
                              },
                              child: Image.asset("assets/icons/request.png"))
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
