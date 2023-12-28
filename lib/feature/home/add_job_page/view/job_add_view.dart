import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/core/components/find_job_icon_button.dart';
import '../view_model/car_add_view_model.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/find_job_button_widget.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';

class JobAddView extends StatelessWidget {
  const JobAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<CarrAddViewModel>(
      viewModel: CarrAddViewModel(),
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
              "Sirket Ekle",
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
                            controller: viewModel.plakaController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Şirket İsmi",
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: "Oluşturulacak şirketin ismini giriniz",
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
                            controller: viewModel.markaModelController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Şirket Konumu",
                              labelStyle: ITheme.of(context).bodySmall,
                              hintText: "Şirketin Konumunu giriniz",
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                              child: Text(
                                "Sirket Logosu",
                                style: ITheme.of(context).bodyMedium.copyWith(
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 240.0,
                              decoration: BoxDecoration(
                                color: ITheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  // aracFotoYukle
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: ITheme.of(context).primaryBackground,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: FindJobIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 0.0,
                                        borderWidth: 0.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.add,
                                          color: ITheme.of(context).primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          final url = await viewModel.uploadImageToFirebase();
                                          viewModel.setCarUrl(url ?? "");
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Şirket için logo seçin",
                                      textAlign: TextAlign.center,
                                      style: ITheme.of(context).bodyMedium,
                                    ),
                                    Observer(builder: (_) {
                                      return SizedBox(
                                        height: 120,
                                        child: Image.network(viewModel.carUrl),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 60.0),
                          child: PlacarsButtonWidget(
                            onPressed: () async {
                              try {
                                await viewModel.addCar();
                              } catch (e) {
                                inspect(e);
                                viewModel.showSnackSError();
                              }
                            },
                            text: "Şirketi Kaydet",
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
