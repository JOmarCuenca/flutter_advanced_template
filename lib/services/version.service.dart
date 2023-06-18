import 'package:flutter_advanced_template/generated/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';


abstract class AppVersionService {
  static Future<PackageInfo>? _loader;

  static void init() => _loader = PackageInfo.fromPlatform();

  static Future<String> get appVersion async => _loader != null ? (await _loader!).version : S.current.loadingDots;
}
