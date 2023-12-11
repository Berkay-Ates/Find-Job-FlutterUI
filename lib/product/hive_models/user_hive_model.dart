import 'package:hive_flutter/adapters.dart';

import '../enums/hive_constants.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveConstant.userHiveID)
class UserHiveModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? surname;
  @HiveField(3)
  final String? mail;
  @HiveField(4)
  final String? person_id;
  @HiveField(5)
  final String? profile_img_url;
  @HiveField(6)
  final String? created_date;
  @HiveField(7)
  final String? gender;
  @HiveField(8)
  final bool? is_active;
  @HiveField(9)
  final String? user_password;

  UserHiveModel(
    this.id,
    this.name,
    this.surname,
    this.mail,
    this.person_id,
    this.profile_img_url,
    this.created_date,
    this.gender,
    this.is_active,
    this.user_password,
  );
}
