// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      mail: json['mail'] as String?,
      person_id: json['person_id'] as String?,
      created_date: json['created_date'] as String?,
      gender: json['gender'] as String?,
      is_active: json['is_active'] as bool?,
      user_password: json['user_password'] as String?,
      profile_img_url: json['profile_img_url'] as String?,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
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
