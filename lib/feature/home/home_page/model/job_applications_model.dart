class JobApplications {
  List<JobApplication>? result;
  int? count;

  JobApplications({this.result, this.count});

  JobApplications.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <JobApplication>[];
      json['result'].forEach((v) {
        result!.add(JobApplication.fromJson(v));
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

class JobApplication {
  String? jobApplicationId;
  String? applicationDate;
  int? companyId;
  String? jobId;
  String? userId;

  JobApplication({
    this.jobApplicationId,
    this.applicationDate,
    this.companyId,
    this.jobId,
    this.userId,
  });

  JobApplication.fromJson(Map<String, dynamic> json) {
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
