// api_endpoints.dart
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.example.com';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User
  static const String profile = '/user/profile';

  // Common
  static String userById(String id) => '/users/$id';

  // Transcript service
  static const String transcriptBaseUrl = 'https://api.gladia.io/v2';
  static const String transcriptBaseUrlKey = 'a48f8e9c-d051-402b-9ad8-16877efbe533';
  static const String transcriptLoad = '/upload';
  static const String transcriptJobCreate = '/pre-recorded';

  static String transcriptResultEndpoint(String id) =>
      '$transcriptJobCreate/$id';
}
