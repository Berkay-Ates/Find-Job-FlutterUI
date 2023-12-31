import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/core/components/find_job_button_widget.dart';
import 'package:placars_savt/core/components/find_job_icon_button.dart';

import '../view_model/profile_settings_view_model.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileSettingsViewModel>(
        viewModel: ProfileSettingsViewModel(),
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
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Profili Güncelle",
                style: ITheme.of(context).headlineMedium,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x430F1113),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Observer(builder: (_) {
                                  return Image.network(
                                    viewModel.userHiveModel?.profile_img_url ??
                                        'https://images.unsplash.com/photo-1531123414780-f74242c2b052?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                  );
                                }),
                              ),
                            ),
                          ),
                          Form(
                              key: viewModel.formKey,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: viewModel.schoolController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: "Okul Bilgini Gir",
                                                hintText: "Okul Bilginizi Giriniz",
                                                hintStyle: ITheme.of(context).bodySmall,
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ITheme.of(context).primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                              ),
                                              style: ITheme.of(context).bodyMedium,
                                              maxLines: null,
                                              validator: ((value) {
                                                if ((value?.isEmpty ?? true)) {
                                                  return "Tum bilgileri giriniz";
                                                }
                                                return null;
                                              }), // _model.textController2Validator.asValidator(context),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              controller: viewModel.experienceController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: "Deneyim Yılınızı Giriniz",
                                                hintText: "Deneyim yılınızı giriniz",
                                                hintStyle: ITheme.of(context).bodySmall,
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ITheme.of(context).primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                              ),
                                              style: ITheme.of(context).bodyMedium,
                                              maxLines: null,
                                              validator: ((value) {
                                                if ((value?.isEmpty ?? true)) {
                                                  return "Tum bilgileri giriniz";
                                                }
                                                return null;
                                              }), // _model.textController3Validator.asValidator(context),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                          Observer(builder: (_) {
                            return FindJobButtonWidget(
                              onPressed: () async {
                                await viewModel.updateProfile();
                              },
                              text: 'Profili Güncelle',
                              options: FindJobButtonOptions(
                                width: 120.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: ITheme.of(context).primary,
                                textStyle: ITheme.of(context).titleSmall.copyWith(
                                      fontFamily: 'Lexend',
                                      fontSize: 14.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
