import 'dart:developer';

import 'package:flutter/foundation.dart';

void logIfDebugging(Object? message) {
  if (kDebugMode) log("$message");
}
