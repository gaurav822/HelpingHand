import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/common/widgets/submit_button.dart';
import 'package:helpinghand/core/app_color.dart';
import 'package:helpinghand/core/colors/light_theme_color.dart';
import 'package:helpinghand/features/dashboard/screens/pending_payment_screen.dart';
import 'package:helpinghand/features/service/models/service.dart';

import '../../../Utils/AssetMapper.dart';
import '../../../core/app_style.dart';

class PaymentScreen extends StatelessWidget {
  final List<Service> selectedServices;

  const PaymentScreen({Key? key, required this.selectedServices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = selectedServices.fold(0, (sum, service) => sum + service.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment',style: style24Medium(),),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selected Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedServices.length,
                itemBuilder: (context, index) {
                  final service = selectedServices[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      tileColor: Colors.green[100],
                      leading: Image.asset(AssetMapper(service.typename).assetPath, height: 40, width: 40),
                      title: Text(
                        service.typename,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(service.description),
                      trailing: Text(
                        '\$${service.price}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.blue[100],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(child: Text("Payee Details",style: style20Semibold(),)),
                      SizedBox(height: 10,),
                      Text("Deposit Amount : \$$totalPrice",style: style16Medium(),),
                      SizedBox(height: 10,),
                      Text("Pay Id : helpinghand@gmail.com",style: style16Medium(),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.info,color: Colors.blue[500],),
                          SizedBox(width: 10,),
                          Flexible(child: Text("Please pay the amount in above account and Confirm Payment",softWrap: true,overflow: TextOverflow.visible,)),
                        ],
                      )

                    ],
                  ),
                ),
              ),

                ),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: style20Semibold(),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 20),
            SubmitButton(text: 'Confirm Payment',onPressedCallback: (){
              Get.to(const PaymentPendingScreen());
            },),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
