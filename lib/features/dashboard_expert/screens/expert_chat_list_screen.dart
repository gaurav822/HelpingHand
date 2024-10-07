import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/dashboard_expert/controllers/expert_service_controller.dart';
import 'package:helpinghand/features/dashboard_expert/screens/expert_chat_req_widget.dart';

import '../../../common/widgets/chat_request.dart';
import '../../../common/widgets/submit_button.dart';
import '../../../core/app_style.dart';
import '../../service/controllers/service_controller.dart';


class ExpertChatListScreen extends StatelessWidget {
  const ExpertChatListScreen({
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
    final serviceController = ExpertServiceController.instance;
    return SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Obx(() {
                if (serviceController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (serviceController.services.isEmpty) {
                  return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/no_result.jpg"),
                          const SizedBox(height: 20,),
                          Text("Chats Unavailable",style: style20Bold(),),
                          const SizedBox(height: 20,),
                          const Text("Students need to request first!"),


                        ],
                      )

                  );

                } else {
                  return Column(
                    children: serviceController.services.map((serviceReq) {
                      return ExpertChatReqWidget(service: serviceReq,tid: serviceReq.serviceId.studentId,);
                    }).toList(),
                  );
                }
              }),
            )));
  }
}
