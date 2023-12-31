import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placars_savt/core/components/find_job_icon_button.dart';
import 'package:placars_savt/feature/home/add_job_page/view_model/job_add_view_model.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/find_job_button_widget.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';

class JobAddView extends StatelessWidget {
  const JobAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<JobAddViewModel>(
      viewModel: JobAddViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          key: viewModel.scaffoldKey,
          backgroundColor: ITheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: ITheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FindJobIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: ITheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context, false);
              },
            ),
            title: Text(
              "İş İlanı Ekle",
              style: ITheme.of(context).headlineMedium,
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.jobTitleController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "İş İlanı Başlığı",
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: "Oluşturulacak ilanın başlığını giriniz",
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            style: ITheme.of(context).bodyMedium,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.companyNameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Sirket İsmi Giriniz",
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: "Var olan bir Şirket Girmelisiniz",
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            style: ITheme.of(context).bodyMedium,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.salaryController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Maaş Bilgisi",
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: "Maaş Bilgisini Giriniz",
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            style: ITheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: viewModel.jobDescriptionController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "İş Açıklaması giriniz",
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: "İş hakkında açıklama yapınız",
                              hintStyle: ITheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: ITheme.of(context).secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                            ),
                            maxLines: 5,
                            style: ITheme.of(context).bodyMedium,
                            keyboardType: TextInputType.text,
                            validator: viewModel.textFieldsValidator,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 60.0),
                          child: FindJobButtonWidget(
                            onPressed: () async {
                              try {
                                await viewModel.addJob();
                              } catch (e) {
                                inspect(e);
                                viewModel.showSnackSError(e.toString());
                              }
                            },
                            text: "İlanı Kaydet",
                            options: FindJobButtonOptions(
                              width: 190.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: ITheme.of(context).primary,
                              textStyle: ITheme.of(context).titleSmall.copyWith(
                                    fontFamily: 'Lexend',
                                    color: ITheme.of(context).textColor,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onDispose: (viewModel) => viewModel.dispose(),
    );
  }
}
