import 'package:flutter_advanced_template/models/base.hive.model.dart';
import 'package:flutter_advanced_template/utils/strings.dart';
import 'package:hive/hive.dart';

import 'storage.service.model.dart';

abstract class HiveStorageServiceModel<T extends HiveBaseModel> extends StorageServiceModel<T> {
  final String _boxName;

  HiveStorageServiceModel(this._boxName);

  Future<Box<T>> _openBox() => Hive.openBox(_boxName);

  @override
  Future<String> create(T object) async {
    final newId = StringUtils.getUUID();
    final box = await _openBox();
    await box.put(newId, object);
    assert(object.key == newId);
    return newId;
  }

  @override
  Future<T?> get(String key) async => (await _openBox()).get(key);

  @override
  Future<void> update(T object, {bool modified = true}) async {
    if (modified) object.modifiedAt = DateTime.now();
    await _openBox();
    return object.save();
  }

  @override
  Future<void> delete(String key) async => (await _openBox()).delete(key);

  @override
  Future<List<T>> getAll() async => (await _openBox()).values.toList();

  @override
  Future<int> setAll(Iterable<T> objects, {bool modified = true}) {
    final saveOps = objects.map((obj) => (obj.isInBox) ? update(obj, modified: modified) : create(obj));
    return Future.wait(saveOps).then((value) => value.length);
  }

  @override
  Future<int> deleteWithIds(Iterable<String> keys) {
    final deleteOps = keys.map((e) => delete(e));
    return Future.wait(deleteOps).then((value) => value.length);
  }

  @override
  Future<int> dropAll() async => (await _openBox()).clear();
}
