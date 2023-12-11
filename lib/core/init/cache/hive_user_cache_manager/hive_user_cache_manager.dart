import 'package:hive/hive.dart';

import '../../../../product/enums/hive_constants.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../hive/hive_model.dart';

class UserHiveCacheManager extends IHivecacheManager<UserHiveModel> {
  UserHiveCacheManager(super.key);

  @override
  Future<void> addItems(List<UserHiveModel> items) async {
    // ignore: unused_local_variable
    final response = await box?.addAll(items);
  }

  @override
  UserHiveModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  List<UserHiveModel>? getValues() {
    return box?.values.toList();
  }

  @override
  Future putItem(String key, UserHiveModel model) async {
    await box?.put(key, model);
  }

  @override
  Future<void> putItems(List<UserHiveModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  void registerAdaptor() {
    if (!Hive.isAdapterRegistered(HiveConstant.userHiveID)) {
      Hive.registerAdapter(UserHiveModelAdapter());
    }
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }
}
