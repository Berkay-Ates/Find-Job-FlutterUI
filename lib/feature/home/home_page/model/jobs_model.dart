class Jobs {
  List<JobResult>? result;
  int? count;

  Jobs({this.result, this.count});

  Jobs.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <JobResult>[];
      json['result'].forEach((v) {
        result!.add(JobResult.fromJson(v));
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

class JobResult {
  String? title;
  String? description;
  int? application_count;
  int? salary;
  String? created_data;
  String? job_id;
  String? company_id;

  JobResult(
      {this.title,
      this.description,
      this.application_count,
      this.salary,
      this.created_data,
      this.job_id,
      this.company_id});

  JobResult.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    application_count = json['application_count'];
    salary = json['salary'];
    created_data = json['created_data'];
    job_id = json['job_id'];
    company_id = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['application_count'] = application_count;
    data['salary'] = salary;
    data['created_data'] = created_data;
    data['job_id'] = job_id;
    data['company_id'] = company_id;
    return data;
  }
}
