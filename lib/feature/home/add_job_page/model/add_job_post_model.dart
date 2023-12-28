// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_job_post_model.g.dart';

@JsonSerializable()
class JobPostModel {
  String? title;
  String? description;
  String? application_count;
  String? salary;
  String? company_name;

  JobPostModel(
    this.title,
    this.description,
    this.application_count,
    this.salary,
    this.company_name,
  );

  factory JobPostModel.fromJson(Map<String, dynamic> json) {
    return _$JobPostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$JobPostModelToJson(this);
  }
}
