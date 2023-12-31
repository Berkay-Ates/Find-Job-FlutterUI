// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/init/theme/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../../../../product/image/image_enums.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/find_job_button_widget.dart';
import '../view_model/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
        viewModel: SignInViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return Scaffold(
            key: viewModel.scaffoldKey,
            backgroundColor: ITheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Form(
                  key: viewModel.formState,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    context.read<ThemeProvider>().getThemeData == ThemeData.dark()
                                        ? ImageEnumName.findJob.svgPath
                                        : ImageEnumName.findJob2.svgPath,
                                    color: context.read<ThemeProvider>().getThemeData == ThemeData.dark()
                                        ? ITheme.of(context).primaryText
                                        : Colors.black,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "FINDJOB'a Hoş Geldin!",
                                          style: GoogleFonts.getFont(
                                            'Montserrat',
                                            color: ITheme.of(context).primaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Uygulamaya Giriş Yap!',
                                            style: ITheme.of(context).titleMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          controller: viewModel.mailAddressLoginController,
                                          decoration: InputDecoration(
                                            labelText: 'Mail Addresi',
                                            labelStyle: ITheme.of(context).bodySmall.copyWith(
                                                  fontFamily: 'Lexend',
                                                  color: ITheme.of(context).primaryText,
                                                ),
                                            hintText: 'Mail Addresinizi Giriniz',
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
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                          ),
                                          style: ITheme.of(context).bodyMedium,
                                          validator: (value) =>
                                              value?.isNotEmpty ?? false ? null : 'Gecersiz bir mail addresi girdiniz'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                      child: Observer(builder: (_) {
                                        return TextFormField(
                                          controller: viewModel.passwordLoginController,
                                          obscureText: viewModel.passwordLoginVisibility,
                                          decoration: InputDecoration(
                                            labelText: 'Sifreniz',
                                            labelStyle: ITheme.of(context).bodySmall.copyWith(
                                                  fontFamily: 'Lexend',
                                                  color: ITheme.of(context).primaryText,
                                                ),
                                            hintText: 'Şifrenizi Giriniz',
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
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                            suffixIcon: InkWell(
                                              onTap: () => viewModel.changePasswordVisibility(),
                                              focusNode: FocusNode(skipTraversal: true),
                                              child: Icon(
                                                viewModel.passwordLoginVisibility
                                                    ? Icons.visibility_off_outlined
                                                    : Icons.visibility_outlined,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          style: ITheme.of(context).bodyMedium,
                                          validator: (value) =>
                                              ((value?.length ?? 0) >= 5) ? null : 'Geçersiz Bir Şifre Girdiniz',
                                        );
                                      }),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                          child: FindJobButtonWidget(
                                            onPressed: () async {
                                              viewModel.navigateForgotPassPage();
                                            },
                                            text: 'Şifremi Unuttum',
                                            options: FindJobButtonOptions(
                                              width: 170.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0x001A1F24),
                                              textStyle: ITheme.of(context).bodySmall,
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Observer(builder: (_) {
                                          return FindJobButtonWidget(
                                            onPressed: () async {
                                              await viewModel.signInUser();
                                            },
                                            text: 'Giriş Yap',
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: viewModel.navigateSignUpPage,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.8,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: ITheme.of(context).secondaryBackground,
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Hesabınız Yok Mu?',
                                                  style: ITheme.of(context).bodyMedium,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    'Hesap Aç',
                                                    style: ITheme.of(context).bodyMedium.copyWith(
                                                        fontFamily: 'Lexend', color: ITheme.of(context).primary),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_rounded,
                                                  color: ITheme.of(context).primary,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
        onDispose: (viewModel) => viewModel.dispose());
  }
}
