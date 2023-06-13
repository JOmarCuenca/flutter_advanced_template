import 'dart:developer';

import 'package:flutter/foundation.dart';

void logIfDebugging(Object? o) {
  if (kDebugMode) log("$o");
}
