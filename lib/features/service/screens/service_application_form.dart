import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Utils/Validator/FormValidator.dart';
import '../../../../common/text_strings.dart';
import '../../../../common/widgets/choose_image_widget.dart';
import '../../../../common/widgets/field_widget.dart';
import '../../../../common/widgets/submit_button.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../authentication/controllers/signup/signup_controller.dart';
import '../controllers/job_app_form_controller.dart';

class ServiceApplicationForm extends StatefulWidget {
  final String serviceType;
  const ServiceApplicationForm({super.key,required this.serviceType});

  @override
  _ServiceApplicationFormState createState() => _ServiceApplicationFormState();
}

class _ServiceApplicationFormState extends State<ServiceApplicationForm> {
  final controller = Get.put(JobAppFormController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    this.widget.serviceType=="job"?GTexts.jobApplication:"Accomodation Application",
                    style: style20Medium(),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    // Full Name
                    FieldWidget(
                      label: GTexts.fullName,
                      controller: controller.firstName,
                      validator: (value) =>
                          FormValidator.validateEmptyText(GTexts.fullName, value),
                    ),
                    const SizedBox(height: 10),

                    // Visa Status
                    this.widget.serviceType=="job"?FieldWidget(
                      label: GTexts.visaStatus,
                      controller: controller.visaStatus,
                      validator: (value) =>
                          FormValidator.validateEmptyText(GTexts.visaStatus, value),
                    ):const SizedBox(),
                    const SizedBox(height: 10),

                    // Contact Information
                    FieldWidget(
                      label: GTexts.phoneNumber,
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          FormValidator.validatePhoneNumber(value),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: GTexts.email,
                      controller: controller.emailAddress,
                      validator: (value) =>
                          FormValidator.validateEmail(value),
                    ),
                    const SizedBox(height: 10),

                    // Education
                    FieldWidget(
                      label: this.widget.serviceType=="job"? GTexts.uniColg:"Preferred Move In Date",
                      controller: controller.schoolName,
                      validator: (value) =>
                          FormValidator.validateEmptyText(this.widget.serviceType=="job"? GTexts.school:"Preferred Move In Date",value),
                    ),
                    const SizedBox(height: 10),

                    FieldWidget(
                      label:  this.widget.serviceType=="job"?GTexts.course:"Budget Range",
                      controller: controller.course,
                      validator: (value) =>
                          FormValidator.validateEmptyText(this.widget.serviceType=="job"? GTexts.course:"Budget Range",value),
                    ),
                    const SizedBox(height: 10),

                    this.widget.serviceType=="job"?FieldWidget(
                      label: GTexts.gradDate,
                      controller: controller.gradDate,
                      validator: (value) =>
                          FormValidator.validateEmptyText(GTexts.gradDate,value),
                    ):SizedBox(),
                    const SizedBox(height: 10),


                    const SizedBox(height: 30),

                    // Resume Upload
                    ImagePickerWidget(
                        title:  this.widget.serviceType=="job"?GTexts.uploadResume:"Upload Identification Proof (Passport/Driver's Licence)",
                        onImagePicked: (value)=>{
                          setState(() {
                            // Handle resume upload
                          })
                        }),
                    const SizedBox(height: 30,),

                    SubmitButton(
                      text: GTexts.submit,
                      onPressedCallback: () {
                        controller.submitForm();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
