// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String? name;
  final String? surname;
  final String? mail;
  final String? person_id;
  final String? created_date;
  final String? gender;
  final bool? is_active;
  final String? user_password;
  final String? profile_img_url;
  final int? experience;
  final String? school;

  ProfileModel({
    this.name,
    this.surname,
    this.mail,
    this.person_id,
    this.created_date,
    this.gender,
    this.is_active,
    this.user_password,
    this.profile_img_url,
    this.experience,
    this.school,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileModelToJson(this);
  }
}
