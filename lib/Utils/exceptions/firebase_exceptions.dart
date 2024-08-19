class GFirebaseException implements Exception {
  final String code;

  GFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'invalid-custom-token':
        return 'The custom token format is incorrect or the token is invalid for some reason.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'invalid-credential':
        return 'The supplied auth credential is malformed or has expired.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'Operation is not allowed. Please enable it in the Firebase console.';
      case 'weak-password':
        return 'The password must be 6 characters long or more.';
      case 'expired-action-code':
        return 'The action code has expired.';
      case 'invalid-action-code':
        return 'The action code is invalid. This can happen if the code is malformed or has already been used.';
      case 'invalid-message-payload':
        return 'The email template corresponding to this action contains invalid characters in its message. Please correct the email template in the Firebase Console.';
      case 'invalid-oob-code':
        return 'The out of band code is invalid.';
      case 'expired-oob-code':
        return 'The out of band code has expired.';
      case 'invalid-verification-code':
        return 'The verification code is not valid.';
      case 'invalid-verification-id':
        return 'The verification ID is not valid.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'user-token-expired':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'invalid-api-key':
        return 'Your API key is invalid, please check you have copied it correctly.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication. Please verify that the correct package name and SHA-1 are configured in the Firebase Console.';
      case 'keychain-error':
        return 'An error occurred with the keychain.';
      case 'internal-error':
        return 'An internal error has occurred.';
      case 'missing-email':
        return 'An email address must be provided.';
      case 'invalid-phone-number':
        return 'The phone number is in an invalid format.';
      case 'invalid-app-credential':
        return 'The app credential is invalid.';
      case 'missing-app-credential':
        return 'The phone verification request is missing the app credential.';
      case 'invalid-app-id':
        return 'The mobile app identifier is not valid.';
      case 'quota-exceeded':
        return 'The project has exceeded its quota for this operation.';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';
      case 'invalid-argument':
        return 'An invalid argument was provided.';
      case 'missing-argument':
        return 'A required argument is missing.';
      case 'project-not-found':
        return 'No project was found for this request.';
      case 'auth-domain-config-required':
        return 'An authentication domain configuration is required for this operation.';
      case 'invalid-tenant-id':
        return 'The tenant ID is invalid.';
      case 'tenant-id-mismatch':
        return 'The tenant ID provided does not match the tenant ID of the authenticated user.';
      case 'admin-restricted-operation':
        return 'This operation is restricted to administrators only.';
      case 'invalid-session-cookie-duration':
        return 'The session cookie duration is invalid.';
      case 'invalid-continue-uri':
        return 'The continue URL provided in the request is invalid.';
      case 'missing-continue-uri':
        return 'A continue URL must be provided in the request.';
      case 'unauthorized-continue-uri':
        return 'The domain of the continue URL is not whitelisted. Please whitelist the domain in the Firebase Console.';
      default:
        return 'An unknown firebase error occurred with code: $code';
    }
  }
}
