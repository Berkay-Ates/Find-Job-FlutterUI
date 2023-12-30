enum HomeJobsorderEnums {
  highPaid,
  newest,
  popular,
  none;

  String get enumValue {
    switch (this) {
      case HomeJobsorderEnums.highPaid:
        return "higestSalaryJobs";
      case HomeJobsorderEnums.newest:
        return "newestJobs";
      case HomeJobsorderEnums.popular:
        return "mostAppliedJobs";
      case HomeJobsorderEnums.none:
        return "";
    }
  }
}
