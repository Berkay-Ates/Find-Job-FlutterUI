// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      mail: json['mail'] as String?,
      person_id: json['person_id'] as String?,
      created_date: json['created_date'] as String?,
      gender: json['gender'] as String?,
      is_active: json['is_active'] as bool?,
      user_password: json['user_password'] as String?,
      profile_img_url: json['profile_img_url'] as String?,
      experience: json['experience'] as int?,
      school: json['school'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
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
      'experience': instance.experience,
      'school': instance.school,
    };
