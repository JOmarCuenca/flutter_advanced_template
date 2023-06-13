import 'package:flutter/material.dart';
import 'package:flutter_advanced_template/generated/l10n.dart';
import 'package:flutter_advanced_template/routes/index.dart';
import 'package:flutter_advanced_template/services/version.service.dart';
import 'package:flutter_advanced_template/theme/theme.dart';

void main() {
  S.load(const Locale("en"));
  AppVersionService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Advanced Template',
      theme: appTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
