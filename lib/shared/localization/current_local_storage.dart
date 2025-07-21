import 'package:xticket/data/localstorage/app_local_storage_key.dart';
import '../../data/localstorage/app_local_storage.dart';

class CurrentLocalStorage {
  static final AppStorage _storage = AppStorage();

  /// Set language code
  static Future<void> setLanguageCode({required String languageCode}) async {
    await _storage.save<String>(
      AppLocalStorageKey.languageCodeKey,
      languageCode,
    );
  }

  /// Get language code
  static Future<String?> getLanguageCode() async {
    return await _storage.read<String>(AppLocalStorageKey.languageCodeKey);
  }
}
