class EmailVerifyModel {
  List<Result>? result;
  int? count;

  EmailVerifyModel({this.result, this.count});

  EmailVerifyModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
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

class Result {
  String? name;
  String? surname;
  String? mail;
  String? person_id;
  String? created_date;
  bool? is_active;
  String? gender;

  Result({this.name, this.surname, this.mail, this.person_id, this.created_date, this.is_active, this.gender});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    mail = json['mail'];
    person_id = json['person_id'];
    created_date = json['created_date'];
    is_active = json['is_active'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['mail'] = mail;
    data['person_id'] = person_id;
    data['created_date'] = created_date;
    data['is_active'] = is_active;
    data['gender'] = gender;
    return data;
  }
}
