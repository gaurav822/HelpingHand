import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:helpinghand/common/loader/loaders.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return null;
      return image;
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh no!:",message: "Error picking image from Camera: $e");
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      return image;
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh no!:",message: "Error picking image from gallery: $e");
      return null;
    }
  }
}
