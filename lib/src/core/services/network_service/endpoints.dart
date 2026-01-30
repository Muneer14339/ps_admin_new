//----------------------------------------- baseUrl

const String baseUrl = 'http://93.127.217.36:8001';

//----------------------------------------- auth

const String createSignup = '$baseUrl/api/v1/signup/';

const String verifyEmailUrl = '$baseUrl/api/v1/verify-email/';

const String loginUrl = '$baseUrl/api/v1/login/';

const String passwordResetUrl = '$baseUrl/api/v1/password_reset/';

const String passwordResetValidateUrl = '$baseUrl/api/v1/password_reset/validate_token/';

const String passwordResetConfirmUrl = '$baseUrl/api/v1/password_reset/confirm/';

//------------------------------------------user/profile

const String getUserUrl = '$baseUrl/api/v1/user/';

const String changePassEndpoint = 'change_password/';

const String updateUserUrl = '$baseUrl/api/v1/user_update/';



class ApiEndpoints {
  // static const String baseUrl = "https://api.coachzr.com/";
  static const String baseUrl = "https://dev.coachzr.com/";

  // Authentication endpoints
  static const String signup = "user-signup";
  static const String login = "login";
  static const String verifyEmail = "verify-email";
  static const String forgotPassword = "forgot-password";
  static const String verifyResetToken = "verify-reset-token";
  static const String resetPassword = "reset-password";
  static const String resendToken = "resend-token";
  static const String logout = "auth/logout";
  static const String refreshToken = "auth/refresh";

  // User endpoints
  static const String userProfile = "user/profile";
  static const String updateProfile = "user/profile";
  static const String deleteUser = "api/user/delete_user";

  static String getEndpoint(String endpoint) {
    return "$baseUrl$endpoint";
  }
}
