import 'package:get/get.dart';

class FormValidator {

  static String? validateEmail(String? value){

    if(value==null || value.isEmpty){
      return "Email is required";
    }

    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Basic email regex

    if (!emailRegExp.hasMatch(value)) {
      return "Enter a valid email address";
    }

    return null; // Return null if the email is valid
  }

  static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
      return "Password is required";
    }

    if(value.length<6){
      return "Password must be at least 6 characters Long";
    }

    return null;
  }


  static String? validatePhoneNumber(String? value){
    if(value==null || value.isEmpty){
      return "Phone Number is required";
    }

    if(value.length!=10){
      return "Phone number must be at least 10 characters Long";
    }

    if(!value.isPhoneNumber){
      return "Value must be a phone Number";
    }

    return null;
  }

  static String? validateEmptyText(String? fieldName,String? value){
    if(value==null || value.isEmpty){
      return "$fieldName is required";
    }

    return null;
  }

  static String? validatePanNumber(String? fieldName,String? value){
    if(value==null || value.isEmpty){
      return "Pan Number is required";
    }

    if(value.length!=9){
      return "Pan number must be 9 characters Long";
    }

    if(!value.isPhoneNumber){
      return "Value must be a Number";
    }

    return null;
  }
}