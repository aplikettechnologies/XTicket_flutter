enum ApiMethod { get, post, put, delete }

extension ApiMethodExtension on ApiMethod {
  String get name => toString().split('.').last.toUpperCase();
}
