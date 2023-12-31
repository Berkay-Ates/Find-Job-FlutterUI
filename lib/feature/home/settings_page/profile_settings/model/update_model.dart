class UpdateModel {
  String? school;
  int? experience;

  UpdateModel({this.school, this.experience});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['school'] = school;
    data['experience'] = experience;
    return data;
  }
}
