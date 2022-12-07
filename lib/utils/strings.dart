const String kFontFamily = 'Inter';

// auth
const String kLogin = 'Login';
const String kRegister = ' Sign Up';
const String kCreateAccount = 'Create Account';
const String kSignUp = 'Sign Up';
const String kDontHaveAcct = "Don't have an account?";
const String kForgotPassword = 'Forgot username or password?';
const String kNext = 'Next';
const String kMonthlyPowered = 'support@monthly.ng';
const String kProceed = 'Proceed';

// exceptions messages
const kInternetConnectionError = 'No internet connection, try again.';
const kTimeOutError = 'Please check your internet conenction.';
const kServerError = 'Something went wrong, try again.';
const kFormatError = 'Unable to process data at this time.';
const kUnAuthorizedError = 'Session expired, please login to proceed.';
const kDefaultError = 'Oops something went wrong!';
const kBadRequestError = 'Bad request, please try again.';
const kNotFoundError = 'An error occured, please try again.';
const kRequestCancelledError = 'Request to server was cancelled.';
const kError = 'Unable to read server response';

// storage
const String kReferralId = 'referralId';
const String kToken = 'token';
const String kIsNewUser = 'isNewUser';
const String kPassword = 'password';
const String kUser = 'user';
const String kBiometicsStatus = 'biometricsStatus';
const String kUsername = 'username';
const String kNotificationStatus = 'notificationStatus';
const String kSmileConsent = 'smileConsent';

const String kAbout = 'https://www.monthly.ng/about';
const String kFaq = 'https://www.monthly.ng/faqs';
const String kPhoneNumber = '2349161734720';
const String kInquiryText = "Hey! I'm inquiring about";
const String kFinancingTermsUrl =
    'https://blog.monthly.ng/loan-terms-agreement';
const String kFinancingTerms = 'Financing Terms';

// KYC
const String kMonthlyTag = 'MonthlyNG123';
const String kPleaseAcceptSmile = 'Please give consent to continue';

// notifications
const String kYouCantReupload =
    "We already have your previous upload, try again only when your KYC isn't approved";

// intercome
const String kIosKey = 'ios_sdk-da70b7f7886b0a73a6f6690b8dc15d78836660c9';
const String kAndroidKey =
    'android_sdk-41178ee5f531b3985e9fabaf256cdb6693e9034d';
const String kIdKey = 'lnhmo8dh';

// logger
const String kMonthlyLogger = 'MonthlyLogger';

// mono
const String kMono = 'live_pk_j1XUDdOEfuxLlfzqiZlP';
const String kMonoLive = 'live_pk_YyAek2NwxpO07UEJwZeu';

int convertStringToInt(String val) {
  return int.tryParse(val.replaceAll(',', '')) ?? 0;
}

int convertCurrencyToInt(String val) {
  final value = val.substring(1, val.length - 3);
  return int.tryParse(value.replaceAll(',', '')) ?? 0;
}

String convertCurrencyToString(String val) {
  return val.substring(1, val.length - 3);
}
