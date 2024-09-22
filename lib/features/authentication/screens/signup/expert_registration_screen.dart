import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/controllers/signup/expert_signup_controller.dart';
import 'package:helpinghand/features/document/controllers/document_controller.dart';
import 'package:helpinghand/features/service/controllers/service_controller.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Utils/Validator/FormValidator.dart';
import '../../../../common/text_strings.dart';
import '../../../../common/widgets/choose_image_widget.dart';
import '../../../../common/widgets/field_widget.dart';
import '../../../../common/widgets/submit_button.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/colors/light_theme_color.dart';
import '../../controllers/signup/signup_controller.dart';

class ExpertRegisterScreen extends StatefulWidget {
  const ExpertRegisterScreen({super.key});

  @override
  _ExpertRegisterScreenState createState() => _ExpertRegisterScreenState();
}

class _ExpertRegisterScreenState extends State<ExpertRegisterScreen> {
  final controller = Get.put(ExpertSignUpController());
  final documentController = Get.put(DocumentController());

  // Static map of services with service name as the key and service ID as the value
  final Map<String, String> services = {
    'TFN': 'service_001',
    'Bank Setup': 'service_002',
    'Police Check': 'service_003',
    'ABN': 'service_004',
    'Jobs': 'service_005',
    'Accomodation': 'service_006',
  };

  // This map will track which services are selected
  final RxMap<String, bool> selectedServices = <String, bool>{}.obs;

  // Add this to keep track of selected services with image upload statuses
  final RxMap<String, String?> uploadedDocuments = <String, String?>{}.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.forEach((key, value) {
      selectedServices[key] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child:  SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      GTexts.expertReg,
                      style: style20Medium(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      FieldWidget(
                        label: GTexts.firstName,
                        controller: controller.firstName,
                        validator: (value) =>
                            FormValidator.validateEmptyText(GTexts.firstName, value),
                      ),
                      const SizedBox(height: 10),
                      FieldWidget(
                        label: GTexts.lastName,
                        controller: controller.lastName,
                        validator: (value) =>
                            FormValidator.validateEmptyText(GTexts.lastName, value),
                      ),
                      const SizedBox(height: 10),
                      FieldWidget(
                        label: GTexts.email,
                        controller: controller.emailAddress,
                        validator: (value) =>
                            FormValidator.validateEmail(value),
                      ),
                      const SizedBox(height: 10),
                      // FieldWidget(
                      //   label: GTexts.nationality,
                      //   controller: controller.nationality,
                      //   validator: (value) =>
                      //       FormValidator.validateEmptyText( GTexts.nationality,value),
                      // ),
                      // const SizedBox(height: 10),
                      // FieldWidget(
                      //   label: GTexts.phoneNumber,
                      //   controller: controller.phoneNumber,
                      //   validator: (value) =>
                      //       FormValidator.validatePhoneNumber(value),
                      //   keyboardType: TextInputType.number,
                      // ),
                      // const SizedBox(height: 10),
                      //
                      // FieldWidget(
                      //   label: GTexts.address,
                      //   controller: controller.address,
                      //   validator: (value) =>
                      //       FormValidator.validateEmptyText(GTexts.address, value),
                      // ),
                      // const SizedBox(height: 10),
                      //
                      // FieldWidget(
                      //   label: GTexts.shortBio,
                      //   controller: controller.bio,
                      //   maxLines: 2,
                      //   maxLength: 60,
                      //   validator: (value) =>
                      //       FormValidator.validateEmptyText(GTexts.shortBio, value),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Obx(
                            () => FieldWidget(
                            label: GTexts.password,
                            hasSuffix: true,
                            suffixIcon: Icon(controller.hidePassword.value?Iconsax.eye_slash : Iconsax.eye),
                            controller: controller.password,
                            validator: (value) =>
                                FormValidator.validatePassword(value),
                            obscureText: controller.hidePassword.value,
                            onSuffixClicked: () => controller.hidePassword.value = !controller.hidePassword.value
      
                        ),
                      ),
                      const SizedBox(height: 30,),
      
                      // Inside the build method of _ExpertRegisterScreenState
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Select your Expertise",style: style16Medium(),),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: (){
                              _showInformationDialog(context);
                            },
                              child: Image.asset("assets/question.png",height: 30,width: 30,))
                        ],
                      ),
                      const SizedBox(height: 30,),
      
      
                         Obx(() {
                          if(controller.isLoading.value){
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          else if(controller.services.isEmpty){
                            return const Center(child: Text("No Services Found"),);
                          }
                          else{
                            return Column(
                              children: controller.services.map((service) {
                                final isSelected = selectedServices[service.typename]!;
                                return CheckboxListTile(
                                activeColor: LightThemeColor.colorPrimary,
                                title: Text(service.typename, style: style16Medium()),
                                value: isSelected,
                                onChanged: (value) {
                                  selectedServices[service.typename] = value!;
                                },
                                                              );
                              }).toList(),
                            );
                          }
                        }),
      
      
                      const SizedBox(height: 40),
                      SubmitButton(
                        text: GTexts.register,
                        onPressedCallback: () {
                          controller.updateSelectedServices(selectedServices);
                          ExpertSignUpController.instance.signUp();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(GTexts.alreadyAcc, style: style16()),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            GTexts.signIn,
                            style: style16(color: ThemeColor.colorPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 40,)
                ],
              ),
            ),
          ),
        
      ),
    );
  }

  void _showInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: const Text(
            'Important Information',

          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Please select your expertise from the below and for each of the expertise you will need to upload the corresponding documents for background check:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                _buildInfoItem(
                  'TFN',
                  'Upload your own tax file related document issued by Australian document',
                  Icons.file_copy,
                ),
                _buildInfoItem(
                  'ABN',
                  'Upload your own Australian Business related document issued by Australian document',
                  Icons.business,
                ),
                _buildInfoItem(
                  'Bank Setup',
                  'Upload relevant documents',
                  Icons.account_balance,
                ),
                _buildInfoItem(
                  'Police report',
                  'Upload your police report check',
                  Icons.report,
                ),
                _buildInfoItem(
                  'Jobs & Accommodation',
                  'Upload your proof of past works',
                  Icons.work,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: LightThemeColor.colorPrimary,
              ),
              child: Text('OK',style: style16(color: ThemeColor.colorWhiteText),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoItem(String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: LightThemeColor.colorPrimary,
            size: 24,
          ),
          SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '$title -> ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: description,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
