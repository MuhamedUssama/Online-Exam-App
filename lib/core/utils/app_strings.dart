class AppStrings {
  static const String passwordAppBarTitle = "Password";
  static const String loginTitle = "Login";
  static const String signUpTitle = "Sign up";
  static const String forgetPasswordText = 'Forget password?';
  static const String alreadyHaveAccount = 'Already have an Account?';

  static const String forgetPasswordScreenTitle = 'Forget Password';
  static const String forgetPasswordScreenDescription =
      'Please enter your email associated to\n your account';

  static const String emailVerivicationScreenTitle = 'Email verification';
  static const String emailVerivicationScreenDescription =
      'Please enter your code that send to your\n email address';

  static const String resetPasswordScreenTitle = 'Reset password';
  static const String resetPasswordScreenDescription =
      'Password must not be empty and must contain \n6 characters with upper case letter and one \nnumber at least';

  static const String donotHaveAccountText = "Don't have an account?";
  static const String didnotRcieveCode = "Didn't receive code?";
  static const String resendText = "Resend";

  static const String emailHintText = 'Enter Your Email';
  static const String emailLabelText = 'Email';

  static const String passwordHintText = 'Enter Your Password';
  static const String newPasswordLabelText = 'New password';
  static const String passwordLabelText = 'Password';
  static const String enterPassword = 'Enter password';

  static const String rememberMeText = 'Remember me';

  static const String confirmPasswordHintText = 'Enter Your Password';
  static const String confirmPasswordLabelText = 'Confirm password';

  static const String emptyEmailAddress = "Please enter your email address";
  static const String validateEmailAddress = "This email is not valid";

  static const String emptyPassword = 'Please enter your password';
  static const String emptyConfirmPassword =
      'Please enter your confirm password';

  static const String userNameHintText = "Enter your user name";
  static const String userNameLabelText = "User name";
  static const String firstNameHintText = "Enter first name";
  static const String firstNameLabelText = "First name";
  static const String lastNameHintText = "Enter last name";
  static const String lastNameLabelText = "Last name";
  static const String phoneHintText = "Enter phone number";
  static const String phoneLabelText = "Phone number";

  static const String emptyUserName = 'Please enter your user name';
  static const String emptyFirstName = 'Please enter your frist name';
  static const String emptyLastName = 'Please enter your user name';
  static const String emptyPhone = 'Please enter your phone';
  static const String passwordDontMatch = "Password don't match";

  static const String continueText = "Continue";

  static RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
}
