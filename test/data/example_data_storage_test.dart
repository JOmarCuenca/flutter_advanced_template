import 'package:flutter_advanced_template/models/example.model.dart';
import 'package:flutter_advanced_template/services/storage/example.storage.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import '../common/values.dart';

void main() {
  final storage = ExampleStorageService("test_recipe_storage");
  final rng = genTestRng();

  setUp(() async {
    await setUpTestHive();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ExampleObjAdapter());
    }
  });

  tearDown(() => Future.wait([
        tearDownTestHive(),
        Hive.close(),
      ]));

  group("Simple CRUD operations", () {
    test("Create recipe and have it's values stored properly", () async {
      final obj = ExampleObj.blank();
      assert(!obj.isInBox);
      expect(obj.key, null);

      final key = await storage.create(obj);

      assert(obj.isInBox);
      expect(obj.key, key);
    });

    test("Properly get a stored value", () async {
      final key = await storage.create(ExampleObj.blank());

      final obj = await storage.get(key);

      expect(obj?.key, key);
      expect(obj?.isInBox, true);
    });

    test("Update a stored value and see changes reflected", () async {
      ExampleObj obj = ExampleObj.blank();
      final key = await storage.create(obj);

      const newName = "Lasagna";
      final originalDate = obj.modifiedAt;

      obj.name = newName;

      await storage.update(obj);

      obj = (await storage.get(key))!;

      expect(obj.name, newName);
      assert(obj.modifiedAt.isAfter(originalDate));
    });

    test("Delete stored values", () async {
      final key = await storage.create(ExampleObj.blank());

      var obj = await storage.get(key);

      assert(obj != null);

      await storage.delete(key);

      obj = await storage.get(key);

      expect(obj, null);
    });
  });

  group("Complex CRUD operations", () {
    const amountOfTestObjs = 50;

    List<ExampleObj> genObjs() => List.generate(amountOfTestObjs, (i) => ExampleObj.blank()..name = "Jojo Reference #$i");

    test("Set many objs at once", () async {
      final objs = genObjs();

      final amount = await storage.setAll(objs);

      expect(objs.length, amount);
    });

    test("Get the entire database at once", () async {
      final objs = genObjs();

      final amount = await storage.setAll(objs);

      expect(objs.length, amount);

      final objsKeys = objs.map((e) => e.key).whereType<String>().toSet();

      assert(objs.every((element) => element.isInBox));
      expect(objs.length, objsKeys.length);

      final storedObjs = await storage.getAll();

      assert(storedObjs.every((element) => objsKeys.contains(element.key)));
    });

    test("Delete many specific objs at once", () async {
      final objs = genObjs();

      int amount = await storage.setAll(objs);

      expect(objs.length, amount);

      var objsKeys = objs.map((e) => e.key).whereType<String>().toList();

      expect(objs.length, objsKeys.length);

      objsKeys.shuffle(rng);

      objsKeys = objsKeys.sublist(0, (amountOfTestObjs / 2).floor());

      amount = await storage.deleteWithIds(objsKeys);

      for (var key in objsKeys) {
        expect(await storage.get(key), null);
      }

      assert((await storage.getAll()).isNotEmpty);
    });

    test("Delete all objs at once", () async {
      var amount = await storage.setAll(genObjs());

      assert(amount > 0);

      var objs = await storage.getAll();

      expect(objs.length, amount);

      await storage.dropAll();

      assert((await storage.getAll()).isEmpty);
    });
  });
}
