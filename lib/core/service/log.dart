import 'package:flutter/material.dart';

class Log {
  static void onError(Exception err, String methodName, {String? className}) {
    debugPrint('$className.$methodName: $err');
  }
}
