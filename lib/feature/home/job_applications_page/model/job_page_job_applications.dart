class JobPageJobApplicationsModel {
  List<JobPageJobApplication>? result;
  int? count;

  JobPageJobApplicationsModel({this.result, this.count});

  JobPageJobApplicationsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <JobPageJobApplication>[];
      json['result'].forEach((v) {
        result!.add(JobPageJobApplication.fromJson(v));
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

class JobPageJobApplication {
  String? jobApplicationId;
  String? applicationDate;
  int? companyId;
  String? jobId;
  String? userId;

  JobPageJobApplication({this.jobApplicationId, this.applicationDate, this.companyId, this.jobId, this.userId});

  JobPageJobApplication.fromJson(Map<String, dynamic> json) {
    jobApplicationId = json['job_application_id'];
    applicationDate = json['application_date'];
    companyId = json['company_id'];
    jobId = json['job_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_application_id'] = jobApplicationId;
    data['application_date'] = applicationDate;
    data['company_id'] = companyId;
    data['job_id'] = jobId;
    data['user_id'] = userId;
    return data;
  }
}
