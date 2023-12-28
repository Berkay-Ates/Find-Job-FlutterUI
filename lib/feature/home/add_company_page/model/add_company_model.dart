// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  String? name;
  String? company_id;
  String? created_date;
  String? field;
  String? company_img_url;

  CompanyModel(
    this.name,
    this.company_id,
    this.company_img_url,
    this.field,
    this.created_date,
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return _$CompanyModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CompanyModelToJson(this);
  }
}
