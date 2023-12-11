// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String? name;
  final String? surname;
  final String? mail;
  final String? person_id;
  final String? created_date;
  final String? gender;
  final bool? is_active;
  final String? user_password;
  final String? profile_img_url;

  SignUpModel({
    this.name,
    this.surname,
    this.mail,
    this.person_id,
    this.created_date,
    this.gender,
    this.is_active,
    this.user_password,
    this.profile_img_url,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpModelToJson(this);
  }
}
