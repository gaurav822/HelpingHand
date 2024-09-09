import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../Utils/constants.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/exceptions/api_exceptions.dart';

class DocumentRepository extends GetxController {
  static DocumentRepository get instance => Get.find();


  Future<void> uploadDocument(String documentType, XFile file, String serviceId,String userId) async {
    final url = Uri.parse('${AppConstants.baseUrl}/document/upload');

    try {
      // Create a Multipart request
      var request = http.MultipartRequest('POST', url);

      // Add fields to the request
      request.fields['documentType'] = documentType;
      request.fields['serviceId'] = serviceId;
      request.fields['userId'] = userId;

      // Get the file path and create a multipart file
      final mimeType = lookupMimeType(file.path); // Get the MIME type of the file
      var fileStream = await http.MultipartFile.fromPath(
        'file', // Field name expected by the server
        file.path,
        contentType: MediaType(
            mimeType?.split('/')[0] ?? 'application',
            mimeType?.split('/')[1] ?? 'octet-stream'
        ),
      );

      // Attach the file to the request
      request.files.add(fileStream);

      // Send the request
      final response = await request.send();

      if (response.statusCode == 201) {
        // Handle success
        print("Document uploaded successfully.");
      } else {
        // Handle server errors
        final responseBody = await response.stream.bytesToString();
        throw ApiException(response.statusCode, responseBody);
      }
    } on http.ClientException catch (e) {
      throw ApiException(500, e.message); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }
}