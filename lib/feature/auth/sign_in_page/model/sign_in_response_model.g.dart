// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModelResponse _$SignInModelResponseFromJson(Map<String, dynamic> json) =>
    SignInModelResponse(
      json['name'] as String?,
      json['surname'] as String?,
      json['mail'] as String?,
      json['person_id'] as String?,
      json['created_date'] as String?,
      json['gender'] as String?,
      json['is_active'] as bool?,
      json['user_password'] as String?,
      json['profile_img_url'] as String?,
    );

Map<String, dynamic> _$SignInModelResponseToJson(
        SignInModelResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'mail': instance.mail,
      'person_id': instance.person_id,
      'created_date': instance.created_date,
      'gender': instance.gender,
      'is_active': instance.is_active,
      'user_password': instance.user_password,
      'profile_img_url': instance.profile_img_url,
    };
