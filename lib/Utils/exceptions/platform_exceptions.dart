class GPlatformException implements Exception {
  final String code;

  GPlatformException(this.code);

  String get message {
    switch (code) {
      case 'ERROR_APP_NOT_AUTHORIZED':
        return 'The app is not authorized to use Firebase services.';
      case 'ERROR_API_NOT_AVAILABLE':
        return 'The API is not available.';
      case 'ERROR_NETWORK_ERROR':
        return 'A network error occurred.';
      case 'ERROR_USER_NOT_FOUND':
        return 'The user was not found.';
      case 'ERROR_USER_DISABLED':
        return 'The user account has been disabled.';
      case 'ERROR_INVALID_CREDENTIAL':
        return 'The credential is invalid.';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'The email address is already in use.';
      case 'ERROR_WRONG_PASSWORD':
        return 'The password is incorrect.';
      case 'ERROR_USER_TOKEN_EXPIRED':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Email/password accounts are not enabled.';
      case 'ERROR_INVALID_VERIFICATION_CODE':
        return 'The verification code is invalid.';
      case 'ERROR_INVALID_VERIFICATION_ID':
        return 'The verification ID is invalid.';
      case 'ERROR_INVALID_CUSTOM_TOKEN':
        return 'The custom token format is incorrect or the token is invalid for some reason.';
      case 'ERROR_CUSTOM_TOKEN_MISMATCH':
        return 'The custom token corresponds to a different audience.';
      default:
        return 'An unknown platform error occurred with code: $code';
    }
  }
}
