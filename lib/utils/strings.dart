import 'package:uuid/uuid.dart';

abstract class StringUtils {
  static const _uuid = Uuid();

  static String getUUID() => _uuid.v4();
}
