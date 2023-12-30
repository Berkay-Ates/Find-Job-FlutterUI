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
  String? created_date;
  String? job_id;
  int? company_id;
  bool? is_applied;

  JobResult(
      {this.title,
      this.description,
      this.application_count,
      this.salary,
      this.created_date,
      this.job_id,
      this.company_id,
      this.is_applied});

  JobResult.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    application_count = json['application_count'];
    salary = json['salary'];
    created_date = json['created_date'];
    job_id = json['job_id'];
    company_id = json['company_id'];
    is_applied = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['application_count'] = application_count;
    data['salary'] = salary;
    data['created_date'] = created_date;
    data['job_id'] = job_id;
    data['company_id'] = company_id;
    data['is_applied'] = is_applied;
    return data;
  }
}
