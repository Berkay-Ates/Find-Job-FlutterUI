import 'package:json_annotation/json_annotation.dart';

part "sign_in_response_model.g.dart";

@JsonSerializable()
class SignInModelResponse {
  String? name;
  String? surname;
  String? mail;
  String? person_id;
  String? created_date;
  String? gender;
  bool? is_active;
  String? user_password;
  String? profile_img_url;

  SignInModelResponse(
    this.name,
    this.surname,
    this.mail,
    this.person_id,
    this.created_date,
    this.gender,
    this.is_active,
    this.user_password,
    this.profile_img_url,
  );

  factory SignInModelResponse.fromJson(Map<String, dynamic> json) {
    return _$SignInModelResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInModelResponseToJson(this);
  }
}
