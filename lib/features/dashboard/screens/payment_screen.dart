import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/common/widgets/submit_button.dart';
import 'package:helpinghand/core/app_color.dart';
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
            Text("Deposit \$$totalPrice to Pay id : helpinghand@gmail.com & Confirm Payment",style: style16Medium(),softWrap: true,overflow: TextOverflow.visible,),
            const SizedBox(height: 100,),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: style20Semibold(),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 20),
            SubmitButton(text: 'Confirm Payment',onPressedCallback: (){},),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
