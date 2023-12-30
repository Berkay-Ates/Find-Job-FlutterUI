// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:placars_savt/core/components/job_widgets.dart';
import 'package:placars_savt/feature/home/home_page/model/jobs_model.dart';

import '../init/theme/itheme/iTheme.dart';

class CompanyJobsBottomSheetWidget extends StatelessWidget {
  const CompanyJobsBottomSheetWidget({
    Key? key,
    required this.jobs,
  }) : super(key: key);

  final List<JobResult> jobs;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9, // Start at 90% height
      minChildSize: 0.2, // Prevent dragging to less than 90% height
      maxChildSize: 1.0, // Allow full-screen expansion
      builder: (context, scrollController) {
        return Card(
          color: ITheme.of(context).primaryBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          margin: const EdgeInsets.only(top: 90),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              controller: scrollController,
              itemCount: jobs.length,
              padding: const EdgeInsets.only(bottom: 120),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return MyJobsWidget(
                  companyId: jobs[index].company_id.toString(),
                  date: jobs[index].created_date ?? "",
                  title: jobs[index].title ?? "",
                  description: jobs[index].description ?? "",
                  application_count: jobs[index].application_count.toString(),
                  salary: jobs[index].salary.toString(),
                  isApplied: true,
                  buttonLabel: 'Basvur',
                  applyJob: () {},
                );
              },
            ),
          ),
        );
      },
    );
  }
}
