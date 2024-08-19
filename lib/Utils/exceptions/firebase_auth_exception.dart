class GFirebaseAuthException implements Exception {
  final String code;

  GFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'There is no user corresponding to the given email.';
      case 'wrong-password':
        return 'The password is invalid for the given email.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'The verification code is not valid.';
      case 'invalid-verification-id':
        return 'The verification ID is not valid.';
      case 'session-expired':
        return 'The SMS code has expired. Please re-send the verification code to try again.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'internal-error':
        return 'An internal error has occurred. Please try again later.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect or the token is invalid for some reason (e.g., invalid signature, incorrect audience).';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'invalid-api-key':
        return 'Your API key is invalid, please check you have copied it correctly.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication. Please verify that the correct package name and SHA-1 are configured in the Firebase Console.';
      case 'expired-action-code':
        return 'The action code has expired.';
      case 'invalid-action-code':
        return 'The action code is invalid. This can happen if the code is malformed or has already been used.';
      case 'invalid-message-payload':
        return 'The email template corresponding to this action contains invalid characters in its message. Please correct the email template in the Firebase Console.';
      case 'invalid-recaptcha-token':
        return 'The reCAPTCHA token is not valid.';
      case 'invalid-email-verified':
        return 'The email is not verified.';
      case 'quota-exceeded':
        return 'The project has exceeded its quota for this operation.';
      case 'retry-limit-exceeded':
        return 'The maximum number of retries for this operation has been exceeded.';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';
      case 'invalid-continue-uri':
        return 'The continue URL provided in the request is invalid.';
      case 'missing-continue-uri':
        return 'A continue URL must be provided in the request.';
      case 'unauthorized-continue-uri':
        return 'The domain of the continue URL is not whitelisted. Please whitelist the domain in the Firebase Console.';
      default:
        return 'An unknown firebase auth error occurred with code $code';
    }
  }
}
