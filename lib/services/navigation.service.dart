import 'package:flutter/widgets.dart';

abstract class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get globalContext => navigatorKey.currentContext;

  static NavigatorState? get globalNavigator {
    final context = globalContext;

    if (context?.mounted == true) return Navigator.of(context!);

    return null;
  }
}
