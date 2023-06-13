import 'package:hive/hive.dart';

abstract class HiveBaseModel extends HiveObject {
  @HiveField(0)
  DateTime createdAt;
  @HiveField(1)
  DateTime modifiedAt;

  @override
  String? get key => super.key;

  HiveBaseModel({
    required this.createdAt,
    required this.modifiedAt,
  });
}
