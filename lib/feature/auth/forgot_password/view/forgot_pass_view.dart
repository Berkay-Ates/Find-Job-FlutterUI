import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/find_job_button_widget.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../../../../product/validators/email_validators.dart';
import '../view_model/forgot_pass_view_model.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
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
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: ITheme.of(context).grayLight,
                size: 32.0,
              ),
            ),
            title: Text(
              "Unutuln sıfe gonder",
              style: ITheme.of(context).headlineSmall,
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Form(
              key: viewModel.formState,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              "Locle Keys Sıl",
                              style: ITheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: viewModel.emailAddressController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Locale Keys 2",
                          labelStyle: ITheme.of(context).bodySmall,
                          hintText: "Locale keys 3",
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
                        validator: (value) => (value?.isValidMail ?? false) ? null : "Gecersız emaıl",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Observer(builder: (_) {
                        return FindJobButtonWidget(
                          onPressed: viewModel.isLoading ? null : () => viewModel.sendPasswResetMail,
                          text: "",
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
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )),
        );
      },
      onDispose: (viewModel) => viewModel.dispose(),
    );
  }
}
