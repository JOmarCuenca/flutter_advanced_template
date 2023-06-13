import 'package:flutter_advanced_template/models/example.model.dart';
import 'package:flutter_advanced_template/services/storage/models/hive.storage.service.model.dart';

class ExampleStorageService extends HiveStorageServiceModel<ExampleObj> {
  ExampleStorageService(super.boxName);
}