import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helpinghand/Utils/constants.dart';
import 'package:helpinghand/features/dashboard_expert/controllers/expert_profile_controller.dart';
import 'package:helpinghand/features/service/controllers/service_controller.dart';

import '../../../Utils/securestorage/secure_storage_service.dart';
import '../../../common/widgets/chat_request.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../common/widgets/task_progress_frame.dart';
import '../../../core/app_style.dart';


class ExpertHomeScreen extends StatelessWidget {
  const ExpertHomeScreen({
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
    final controller = Get.put(ExpertProfileController());
    final serviceController = Get.put(ServiceController());
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
                  child: RefreshIndicator(
                    onRefresh: () async{
                      await serviceController.getServiceRequests();
                    },
                    child: ListView(
                        children: [
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Obx(()
                              => Row(
                                children: [
                                  Text("Welcome, ${controller.firstName.value}",style: style16Medium(),),
                                  const SizedBox(width: 20,),
                                  Image.asset("assets/welcome_bot.jpg")
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Text("Thank you for being a part of Helping Hand. Manage your services, connect with students, and grow your professional network.",

                              style: style14(),textAlign: TextAlign.left,),

                            const SizedBox(height: 30,),

                            Text("Your Active Tasks",style: style16Medium(),),
                            const SizedBox(height: 20,),
                            Obx(() {
                              if (serviceController.isLoading.value) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (serviceController.serviceRequests.isEmpty) {
                                return const Center(
                                  child: Text("No Tasks found"),
                                );
                              } else {
                                // Filter out the service requests where the status is "Pending"
                                var filteredRequests = serviceController.serviceRequests
                                    .where((service) => service.status != "Pending")
                                    .toList();

                                if (filteredRequests.isEmpty) {
                                  return const Center(
                                    child: Text("No Tasks found"),
                                  );
                                } else {
                                  return Column(
                                    children: filteredRequests.map((service) {
                                      return Container(
                                          margin: const EdgeInsets.only(bottom: 20),
                                          child: TaskProgressFrame(
                                            user: service.studentId,
                                            service: service,
                                          ));
                                    }).toList(),
                                  );
                                }
                              }
                            }),


                            SizedBox(height: 20,),
                            Text("New Student Request",style: style16Medium(),),
                            SizedBox(height: 20,),

                            Obx(() {
                              if (serviceController.isLoading.value) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              else if (serviceController.serviceRequests.isEmpty) {
                                return const Center(child: Text("No Requests Found"));

                              } else {
                                return Column(
                                  children: serviceController.serviceRequests.map((serviceReq) {
                                    return ChatRequestWidget(requestedService: serviceReq,tid: serviceReq.studentId,);
                                  }).toList(),
                                );
                              }
                            }),

                            const SizedBox(height: 20,),
                            // ChatRequestWidget(),

                            const SizedBox(height: 20,),
                            Text("Recent Notifications",style: style16Medium(),),
                            const SizedBox(height: 20,),
                            const Center(child: Text("No Notifications Found")),

                          ],
                        ),]
                    ),
                  ),
                ),
              ),
            )));
  }

}
