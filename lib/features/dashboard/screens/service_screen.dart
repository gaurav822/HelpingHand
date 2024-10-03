import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/core/colors/light_theme_color.dart';
import 'package:helpinghand/features/accomodation/screens/accomodation_listing_screen.dart';
import 'package:helpinghand/features/dashboard/screens/payment_screen.dart';
import 'package:helpinghand/features/dashboard/screens/pending_payment_screen.dart';
import 'package:helpinghand/features/job/screens/job_listing.dart';
import 'package:helpinghand/features/service/models/service.dart';

import '../../../Utils/AssetMapper.dart';
import '../../../core/app_style.dart';
import '../../service/controllers/service_controller.dart';
import '../../service/models/purchase_list.dart';
import '../../service/screens/service_request_screen.dart';

class ServiceListScreen extends StatefulWidget {
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
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final List<Service> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    final serviceController = ServiceController.instance;

    return SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(() {
                    if (serviceController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (serviceController.services.isEmpty) {
                      return const Center(
                        child: Text("No Services found!"),
                      );
                    } else {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: serviceController.services.asMap().entries.map((entry) {
                                int index = entry.key; // This is the position (index)
                                var service = entry.value;

                                // Find the purchase status for each service
                                var status = getServicePaymentStatus(serviceController.purchases, service.id);

                                var reqId = getId(serviceController.purchases, service.id);

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: service.typename == "Jobs" || service.typename == "Accomodation"
                                      ? individualService(service)
                                      : individualServiceWithSelection(service, index, status,reqId),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: selectedServices.isNotEmpty
                                ? () {
                              // Proceed to the payment screen
                              Get.to(() => PaymentScreen(selectedServices: selectedServices));
                            }
                                : null,
                            child: const Text("Proceed to Payment"),
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
            )));
  }

  // Function to check the payment status of a service
  PaymentStatus getServicePaymentStatus(List<Purchase> purchases, String serviceId) {
    for (var purchase in purchases) {
      for(var data in purchase.serviceTypes){
        if (data.id.contains(serviceId)) {
          switch (purchase.paymentStatus.toLowerCase()) {
            case 'confirmed':
              return PaymentStatus.confirmed;
            case 'pending':
              return PaymentStatus.pending;
            case 'failed':
              return PaymentStatus.failed;
            case 'refunded':
              return PaymentStatus.refunded;
            default:
              return PaymentStatus.none;
          }
        }
      }
      }
    return PaymentStatus.none;

  }


  String getId(List<Purchase> purchases, String serviceId) {
    for (var purchase in purchases) {
      for(int j=0;j<purchase.serviceTypes.length;j++){
        if (purchase.serviceTypes[j].id.contains(serviceId)) {
          switch (purchase.paymentStatus.toLowerCase()) {
            case 'confirmed':
              return purchase.services[j].id;
            default:
              return '';
          }
        }
      }
    }
    return '';
  }

  Widget individualService(Service service) {
    return InkWell(
      onTap: () {
        if (service.typename == "Jobs") {
          // Navigate to JobListingScreen
        } else if (service.typename == "Accomodation") {

        } else {
          // Navigate to ServiceRequestScreen
        }
      },
      child: Container(
        color: const Color(0xFFE3EEDA),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Service image based on type
              Image.asset(AssetMapper(service.typename).assetPath),
              Column(
                children: [
                  Text(service.typename),
                  const SizedBox(height: 10),
                  Text('(${service.description})', style: style12()),
                  const SizedBox(height: 10),
                  Text('\$${service.price}', style: style12()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget individualServiceWithSelection(Service service, int index, PaymentStatus status,String reqId) {
    return InkWell(
      onTap: () {
        if (status == PaymentStatus.none) {
          setState(() {
            if (selectedServices.contains(service)) {
              selectedServices.remove(service);
            } else {
              selectedServices.add(service);
            }
          });
        }

        if(status==PaymentStatus.confirmed){
          Get.to(()=>ServiceRequestScreen(service: service,reqId: reqId,));
        }
        if(status==PaymentStatus.pending){
          Get.to(()=>const PaymentPendingScreen());
        }
      },
      child: Container(
        color: const Color(0xFFE3EEDA),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetMapper(service.typename).assetPath),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.typename),
                  const SizedBox(height: 10),
                  Text('(${service.description.length > 24 ? service.description.substring(0, 20) : service.description})', style: style12()),
                  const SizedBox(height: 10),
                  Text('\$${service.price}', style: style12()),
                ],
              ),
              status == PaymentStatus.confirmed
                  ? Image.asset("assets/icons/paid.png", height: 40, width: 40)
                  : status == PaymentStatus.pending
                  ? Image.asset("assets/pending_pay.png", height: 40, width: 40)
                  : Checkbox(
                activeColor: LightThemeColor.colorPrimary,
                checkColor: LightThemeColor.whiteColor,
                value: selectedServices.contains(service),
                onChanged: (bool? value) {
                  if (value != null && value) {
                    selectedServices.add(service);
                  } else {
                    selectedServices.remove(service);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


enum PaymentStatus {
  confirmed,
  pending,
  failed,
  refunded,
  none,
}

// Extend the enum to return the associated string value
extension PaymentStatusExtension on PaymentStatus {
  String get name {
    switch (this) {
      case PaymentStatus.confirmed:
        return 'Confirmed';
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.refunded:
        return 'Refunded';
      case PaymentStatus.none:
        return '';
      default:
        return '';
    }
  }
}




