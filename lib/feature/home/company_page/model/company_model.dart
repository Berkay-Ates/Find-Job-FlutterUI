class Companies {
  List<CompanyResult>? result;
  int? count;

  Companies({this.result, this.count});

  Companies.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CompanyResult>[];
      json['result'].forEach((v) {
        result!.add(CompanyResult.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class CompanyResult {
  String? name;
  int? companyId;
  String? createdDate;
  String? field;
  String? companyImgUrl;
  int? jobCount;

  CompanyResult({this.name, this.companyId, this.createdDate, this.field, this.companyImgUrl, this.jobCount});

  CompanyResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    companyId = json['company_id'];
    createdDate = json['created_date'];
    field = json['field'];
    companyImgUrl = json['company_img_url'];
    jobCount = json['job_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['company_id'] = companyId;
    data['created_date'] = createdDate;
    data['field'] = field;
    data['company_img_url'] = companyImgUrl;
    data['job_count'] = jobCount;

    return data;
  }
}
