import 'package:json_annotation/json_annotation.dart';

part "sign_in_model.g.dart";

@JsonSerializable()
class SignInModel {
  String? mail;
  @JsonKey(name: "user_password")
  String? password;

  SignInModel({this.mail, this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return _$SignInModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInModelToJson(this);
  }
}
