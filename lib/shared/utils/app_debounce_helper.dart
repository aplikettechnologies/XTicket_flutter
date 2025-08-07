// lib/utils/app_debounce_helper.dart

import 'dart:async';
import 'package:flutter/foundation.dart'; 

class DebounceHelper {
  static final Map<String, Timer> _timers = {};

  static void runDebounce({
    required String tag,
    required VoidCallback action,
    int milliseconds = 500,
  }) {
    _timers[tag]?.cancel();
    _timers[tag] = Timer(Duration(milliseconds: milliseconds), action);
  }

  static void dispose(String tag) {
    _timers[tag]?.cancel();
    _timers.remove(tag);
  }

  static void disposeAll() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
  }
}
