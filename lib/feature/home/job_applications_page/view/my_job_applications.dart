// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/core/base/view/base_view.dart';
import 'package:placars_savt/core/components/applied_job_widget.dart';
import 'package:placars_savt/core/extension/device_properties/device_properties.dart';
import 'package:placars_savt/feature/home/job_applications_page/view_model/my_jobs_view_model.dart';

import '../../../../core/init/theme/itheme/iTheme.dart';

class CarsView extends StatelessWidget {
  const CarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MyCarsViewModel>(
        viewModel: MyCarsViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(viewModel.unfocusNode),
            child: Scaffold(
              key: viewModel.scaffoldKey,
              backgroundColor: ITheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: ITheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  "Iş Başvurularım",
                  style: ITheme.of(context).headlineMedium,
                ),
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Observer(builder: (_) {
                return viewModel.isloading
                    ? const Center(child: CircularProgressIndicator())
                    : viewModel.appliedJobLists.isEmpty
                        ? Center(
                            child: SizedBox(
                            width: (context.deviceWidth ?? 400) * 0.70,
                            child: Text(
                              "Hiç İş Başvurunuz yok!",
                              textAlign: TextAlign.center,
                              style: ITheme.of(context).labelLarge.copyWith(fontSize: 18),
                            ),
                          ))
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return AppliedJobWidget(
                                  applicationId: viewModel.appliedJobLists[index].jobApplicationId ?? "",
                                  applicationDate: viewModel.appliedJobLists[index].applicationDate ?? "",
                                  companyId: viewModel.appliedJobLists[index].companyId.toString(),
                                  jobId: viewModel.appliedJobLists[index].jobId ?? " ",
                                  userId: viewModel.appliedJobLists[index].userId ?? "",
                                  buttonLabel: "Basvuru Sil",
                                  deleteJobApplication: () {
                                    viewModel.deleteJobApplication(index);
                                  });
                            },
                            itemCount: viewModel.appliedJobLists.length,
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 120.0),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                          );
              }),
            ),
          );
        });
  }
}
