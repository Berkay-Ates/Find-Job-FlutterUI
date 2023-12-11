import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/view_model/base_view_model.dart';
import '../../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../../core/init/cache/hive/hive_model.dart';
import '../../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../product/hive_models/user_hive_model.dart';
import '../../../home_page/model/car_home_post_model.dart';
import '../../../messages_page/chat_page/view/chat_view.dart';

part 'user_self_car_post_view_model.g.dart';

class UserSelfCarPostViewModel = _UserSelfCarPostViewModelBase with _$UserSelfCarPostViewModel;

abstract class _UserSelfCarPostViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  final controller = ScrollController();
  final firestore = FirebaseFirestore.instance;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    initHive();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  Future<void> addRecentlyMessaged(Cars? cars) async {}

  @action
  String tarihiDuzenle(String tarih) {
    DateTime dt = DateTime.parse(tarih);
    String gun = dt.day.toString().padLeft(2, '0');
    String ay = dt.month.toString().padLeft(2, '0');
    String yil = dt.year.toString();
    return "$gun.$ay.$yil";
  }

  @action
  void scrollToBottom() {
    controller.jumpTo(controller.position.minScrollExtent);
  }

  void navigateToChatScreen(Cars? cars) {
    if (cars?.carOwnerEmail != null && (cars?.carOwnerEmail?.isNotEmpty ?? false)) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          baseContext, MaterialPageRoute(builder: ((context) => ChatView(chattingPlate: cars?.carPlate ?? ""))));
    }
  }

  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        LocaleKeys.my_cars_page_warn_txt.translate,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  String setUserName(String firebaseSender, String carOwner) {
    return userHiveModel?.mail == firebaseSender
        ? "Sen"
        : userHiveModel?.mail == carOwner
            ? "Arabanın Sahibi"
            : firebaseSender;
  }
}
