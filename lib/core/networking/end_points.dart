abstract class EndPoints {
  static const String apiBaseUrl = 'https://exam.elevateegy.com/';

  static const String forgetPassword =
      "${apiBaseUrl}api/v1/auth/forgotPassword";

  static const String verifyResetCode =
      "${apiBaseUrl}api/v1/auth/verifyResetCode";

  static const String resetPassword = "${apiBaseUrl}api/v1/auth/resetPassword";
  static const String loginUrl = "${apiBaseUrl}api/v1/auth/signin";
  static const String signUpUrl = "${apiBaseUrl}api/v1/auth/signup";
}
