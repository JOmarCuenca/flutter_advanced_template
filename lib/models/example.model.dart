import 'package:hive/hive.dart';

import 'base.hive.model.dart';

part 'example.model.g.dart';

@HiveType(typeId: 0)
class ExampleObj extends HiveBaseModel {
  @HiveField(3)
  String name;

  ExampleObj({
    required this.name,
    required super.createdAt,
    required super.modifiedAt,
  });

  factory ExampleObj.blank() => ExampleObj(
        name: "Jojo Reference",
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
      );
}
