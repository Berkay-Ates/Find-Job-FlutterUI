// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      json['name'] as String?,
      json['company_id'] as int?,
      json['company_img_url'] as String?,
      json['field'] as String?,
      json['created_date'] as String?,
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'company_id': instance.company_id,
      'created_date': instance.created_date,
      'field': instance.field,
      'company_img_url': instance.company_img_url,
    };
