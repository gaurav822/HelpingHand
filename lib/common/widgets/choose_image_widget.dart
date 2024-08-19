

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/bottom_sheet/bottom_sheet.dart';
import '../../Utils/image_picker_util/image_picker_util.dart';

class ImagePickerWidget extends StatelessWidget {


  final void Function(XFile?) onImagePicked;
  final String title;
  const ImagePickerWidget({super.key,required this.title,required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.grey.shade300,
          child: InkWell(
            splashColor: Colors.grey.shade500,
            onTap: () {
              showGenericBottomSheet(context, [
                {
                  'Camera': () async {
                    onImagePicked(await _pickImageFromCamera());
                  }
                },
                {
                  'Gallery': () async{
                    onImagePicked(await _pickImageFromGallery());
                  }
                },
              ]);
            },
            child:  SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.gallery),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(title)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to handle image picking from camera
  Future<XFile?> _pickImageFromCamera() async {
    XFile? pickedImage = await ImagePickerUtil.pickImageFromCamera();
    if (pickedImage != null) {
      return pickedImage;
    }
    return null;
  }

  // Function to handle image picking from gallery
  Future<XFile?> _pickImageFromGallery() async {
    XFile? pickedImage = await ImagePickerUtil.pickImageFromGallery();
    if (pickedImage != null) {
      return pickedImage;
    }
    return null;
  }
}
