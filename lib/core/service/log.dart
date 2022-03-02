import 'package:flutter/material.dart';

class Log {
  static void onError(Error err, String methodName, {String? className}) {
    debugPrint('$className.$methodName: $err');
  }
}
