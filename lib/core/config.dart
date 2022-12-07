enum Environment { development, production }

class AppConfig {
  AppConfig._();

  static String get baseUrl {
    return 'https://stagingshop.threls.dev';
  }
}
