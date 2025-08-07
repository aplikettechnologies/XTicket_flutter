enum Environment { sit, uat, preprod }

class AppEnvConfig {
  static const Environment _env = Environment.uat;

  static const Map<Environment, String> _baseUrls = {
    Environment.sit: 'https://sit.example.com/api',
    Environment.uat: 'https://uat.example.com/api',
    Environment.preprod: 'https://preprod.example.com/api',
  };

  static String get baseUrl => _baseUrls[_env]!;
}
