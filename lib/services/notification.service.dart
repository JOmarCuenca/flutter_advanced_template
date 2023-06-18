import 'package:flutter/material.dart';
import 'package:flutter_advanced_template/services/navigation.service.dart';

abstract class NotificationService {
  static ScaffoldMessengerState? get globalScaffoldMessenger {
    final context = NavigationService.globalContext;
    if (context?.mounted == true) return ScaffoldMessenger.of(context!);
    return null;
  }

  static void clearSnackbars() => globalScaffoldMessenger?.clearSnackBars();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackbar(SnackBar snackBar) => globalScaffoldMessenger?.showSnackBar(snackBar);

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSimpleTextSnackbar(String text) => showSnackbar(SnackBar(content: Text(text)));
}
