import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_template/generated/l10n.dart';
import 'package:flutter_advanced_template/routes/index.dart';
import 'package:flutter_advanced_template/services/navigation.service.dart';
import 'package:flutter_advanced_template/services/version.service.dart';
import 'package:flutter_advanced_template/theme/theme.dart';
import 'package:hive/hive.dart';

void main() {
  S.load(const Locale("en"));
  AppVersionService.init();
  _initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Advanced Template',
      debugShowCheckedModeBanner: kDebugMode,
      navigatorKey: NavigationService.navigatorKey,
      theme: appTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

void _initHive() {
  Hive.init("hive_stored_space");
  // Hive.registerAdapter(ExampleObjAdapter());
}
