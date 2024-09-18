import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helpinghand/common/loader/loaders.dart';
import 'package:helpinghand/common/widgets/submit_button.dart';
import 'package:helpinghand/features/authentication/controllers/signup/verify_account_controller.dart';
import 'package:helpinghand/features/authentication/models/register_response.dart';
import 'package:helpinghand/features/authentication/screens/login/login_screen.dart';
import 'package:helpinghand/features/authentication/screens/signup/verify_account_screen.dart';
import 'package:helpinghand/features/document/controllers/document_controller.dart';
import 'package:helpinghand/features/document/model/document_service.dart';

import '../../../../common/text_strings.dart';
import '../../../../common/widgets/choose_image_widget.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../service/models/service.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key, required this.profile, required this.documentServices});

  final RegisterResponse profile;
  final List<DocumentService> documentServices;

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  final DocumentController documentController = Get.put(DocumentController());

  // To track the uploaded documents
  Map<String, bool> uploadedDocuments = {};

  @override
  void initState() {
    super.initState();

    // Initialize the uploaded documents map with false (not uploaded)
    for (var docService in widget.documentServices) {
      uploadedDocuments[docService.id] = false;
    }
  }

  // Method to check if all documents have been uploaded
  bool areAllDocumentsUploaded() {
    return uploadedDocuments.values.every((isUploaded) => isUploaded == true);
  }

  // Callback when a document is uploaded
  void onDocumentUploaded(String docId) {
    setState(() {
      uploadedDocuments[docId] = true;
      print("The docId is$docId");// Mark this document as uploaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (areAllDocumentsUploaded()) {
          Get.offAll(const LoginScreen());
          return Future.value(true);
        } else {
          Loaders.errorSnackBar(
              title: 'Warning!',
              message: "Please upload all documents");
          return Future.value(false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              Center(child: Text("Upload Document!", style: style20Bold(),)),
              const SizedBox(height: 20,),
              Center(child: Text(widget.profile.user.email ?? '', style: style14(),)),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Please upload your document to verify your account!",
                  style: style14(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40,),
              Image.asset('assets/icons/verify_document.jpg'),
              const SizedBox(height: 40,),

              // Dynamic list of ImagePickerWidgets based on documentServices
              Expanded(
                child: ListView.builder(
                  itemCount: widget.documentServices.length,
                  itemBuilder: (context, index) {
                    final documentService = widget.documentServices[index];
                    bool isUploaded = uploadedDocuments[documentService.id] ?? false;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ImagePickerWidget(
                              title: 'Upload ${documentService.docName} document',
                              onImagePicked: (value) {
                                if (value != null) {
                                  if (isUploaded) {
                                    Loaders.errorSnackBar(
                                        title: '${documentService.docName} document already uploaded');
                                  } else {
                                    documentController.uploadDocument(
                                        documentService.type, documentService.docName, value, documentService.id, widget.profile);

                                    // Mark the document as uploaded
                                    onDocumentUploaded(documentService.id);
                                  }
                                }
                              },
                            ),
                          ),
                          if (isUploaded)
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Submit button only enabled when all documents are uploaded
              areAllDocumentsUploaded()
                  ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SubmitButton(
                  text: 'Continue',
                  onPressedCallback: () {
                    Get.offAll(const LoginScreen());
                  },
                ),
              )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

}

