import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpinghand/features/authentication/controllers/signup/expert_signup_controller.dart';
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

  // Static map of services with service name as the key and service ID as the value
  final Map<String, String> services = {
    'TFN': 'service_001',
    'ABN': 'service_002',
    'Bank Setup': 'service_003',
    'Police Report': 'service_004',
    'JOBS': 'service_005',
    'Accommodation': 'service_006',
    'Others': 'service_007',
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
      uploadedDocuments[key] = null;
    });
  }

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
                    FieldWidget(
                      label: GTexts.nationality,
                      controller: controller.nationality,
                      validator: (value) =>
                          FormValidator.validateEmptyText( GTexts.nationality,value),
                    ),
                    const SizedBox(height: 10),
                    FieldWidget(
                      label: GTexts.phoneNumber,
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          FormValidator.validatePhoneNumber(value),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),

                    FieldWidget(
                      label: GTexts.address,
                      controller: controller.address,
                      validator: (value) =>
                          FormValidator.validateEmptyText(GTexts.address, value),
                    ),
                    const SizedBox(height: 10),

                    FieldWidget(
                      label: GTexts.shortBio,
                      controller: controller.bio,
                      maxLines: 2,
                      maxLength: 60,
                      validator: (value) =>
                          FormValidator.validateEmptyText(GTexts.shortBio, value),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ImagePickerWidget(
                        title: GTexts.uploadVisa,
                        onImagePicked: (value)=>{
                          setState(() {

                          })
                        }),
                    const SizedBox(height: 30,),
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

                    ...services.keys.map((serviceName) {
                      return Obx(() {
                        final isSelected = selectedServices[serviceName]!;
                        return Column(
                          children: [
                            CheckboxListTile(
                              activeColor: LightThemeColor.colorPrimary,
                              title: Text(serviceName, style: style16Medium()),
                              value: isSelected,
                              onChanged: (value) {
                                selectedServices[serviceName] = value!;
                              },
                            ),
                            if (isSelected)
                              ImagePickerWidget(
                                title: 'Upload document for $serviceName',
                                onImagePicked: (imagePath) {
                                  // uploadedDocuments[serviceName] = imagePath;
                                },
                              ),
                            const SizedBox(height: 10),
                          ],
                        );
                      });
                    }).toList(),



                    const SizedBox(height: 40),
                    SubmitButton(
                      text: GTexts.register,
                      onPressedCallback: () {
                        // SignUpController.instance.signUp(role: 'customer');
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
}
