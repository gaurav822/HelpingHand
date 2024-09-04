import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/widgets/expert_widget.dart';
import '../../../core/app_style.dart';

class ServiceRequestScreen extends StatelessWidget {
  final String serviceName;
  const ServiceRequestScreen({super.key,required this.serviceName});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            for(int i=0;i<5;i++)
              Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      ExpertWidget(),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Fluttertoast.showToast(msg: "Request Sent Successfully !!");
                        },
                          child: Image.asset("assets/icons/request.png"))
                    ],
                  )),
          ],

        ),
      ),
    );
  }
}
