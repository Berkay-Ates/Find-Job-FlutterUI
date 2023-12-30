class JobApplyModel {
  int? companyId;
  String? jobId;
  String? userId;

  JobApplyModel({this.companyId, this.jobId, this.userId});

  JobApplyModel.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    jobId = json['job_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['job_id'] = jobId;
    data['user_id'] = userId;
    return data;
  }
}
