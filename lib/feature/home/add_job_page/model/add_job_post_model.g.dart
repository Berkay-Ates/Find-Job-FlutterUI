// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_job_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPostModel _$JobPostModelFromJson(Map<String, dynamic> json) => JobPostModel(
      json['title'] as String?,
      json['description'] as String?,
      json['application_count'] as String?,
      json['salary'] as String?,
      json['company_name'] as String?,
    );

Map<String, dynamic> _$JobPostModelToJson(JobPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'application_count': instance.application_count,
      'salary': instance.salary,
      'company_name': instance.company_name,
    };
