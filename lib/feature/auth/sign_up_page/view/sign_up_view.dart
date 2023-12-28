import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/find_job_button_widget.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        viewModel: SignUpViewModel(),
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
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.05, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 20.0),
                                      child: Text(
                                        'FINDJOB',
                                        style: ITheme.of(context).bodyMedium.copyWith(
                                              fontFamily: 'Lexend',
                                              fontSize: 50.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 30.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Hadi Başlayalım!',
                                                  style: ITheme.of(context).displaySmall,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Hesabını Olusturmaya Basla',
                                                    style: ITheme.of(context).titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.text,
                                                controller: viewModel.nameController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'isminizi giriniz',
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: 'Buraya isminizi giriniz',
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
                                                    (value?.length ?? 0) >= 5 ? null : 'Gecersiz bir isim girdiniz',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.text,
                                                controller: viewModel.surnameController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Soyisminizi Giriniz',
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: 'Buraya Soyisminizi Giriniz',
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
                                                    (value?.length ?? 0) >= 3 ? null : 'Gecersiz Soyisim Girdiniz',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.emailAddress,
                                                controller: viewModel.mailController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Mail Addresinizi girin',
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: 'Bu maili doğrulamanız gerekecek',
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
                                                    value?.isEmpty ?? false ? 'Gecerli bir mail addresi giriniz' : null,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.text,
                                                controller: viewModel.genderController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Cinsiyet Bilginizi Giriniz',
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: 'Kadin veya Erkek Şeklinde Giriniz',
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
                                                validator: (value) {
                                                  if ((value?.length ?? 0) < 5) {
                                                    return 'Gecersiz Cinsiyet Bilgisi Girdiniz';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: Observer(builder: (_) {
                                                return TextFormField(
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.name,
                                                  controller: viewModel.passwordCreateController,
                                                  obscureText: viewModel.passwordCreateVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: 'Sifrenizi Giriniz',
                                                    labelStyle: ITheme.of(context).bodySmall,
                                                    hintText: 'Buraya Şifrenizi Giriniz',
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
                                                      onTap: () => viewModel.changePasswordsVisibility(),
                                                      focusNode: FocusNode(skipTraversal: true),
                                                      child: Icon(
                                                        viewModel.passwordConfirmVisibility
                                                            ? Icons.visibility_off_outlined
                                                            : Icons.visibility_outlined,
                                                        color: ITheme.of(context).secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: ITheme.of(context).bodyMedium,
                                                  validator: (value) =>
                                                      ((value?.length ?? 0) > 6) ? null : 'Geçersiz Şifre Girdiniz',
                                                );
                                              }),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: Observer(builder: (_) {
                                                return TextFormField(
                                                  textInputAction: TextInputAction.go,
                                                  keyboardType: TextInputType.text,
                                                  controller: viewModel.passwordConfirmController,
                                                  obscureText: viewModel.passwordConfirmVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: 'Şifrenizi Doğrulayın',
                                                    labelStyle: ITheme.of(context).bodySmall,
                                                    hintText: 'Girdiğiniz Şifreler Eşleşmelidir',
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
                                                      onTap: () => viewModel.changePasswordsVisibility(),
                                                      focusNode: FocusNode(skipTraversal: true),
                                                      child: Icon(
                                                        viewModel.passwordConfirmVisibility
                                                            ? Icons.visibility_off_outlined
                                                            : Icons.visibility_outlined,
                                                        color: ITheme.of(context).secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: ITheme.of(context).bodyMedium,
                                                  validator: (value) {
                                                    if (viewModel.isPasswordsMatch()) {
                                                      return null;
                                                    }
                                                    return 'Şifreleriniz Eşleşmiyor!';
                                                  },
                                                );
                                              }),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                              child: Observer(builder: (_) {
                                                return PlacarsButtonWidget(
                                                  onPressed: () async {
                                                    await viewModel.signUpUser();
                                                  },
                                                  text: 'Hesap Oluştur',
                                                  options: FindJobButtonOptions(
                                                    width: 140.0,
                                                    height: 50.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: ITheme.of(context).secondaryBackground,
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_back_rounded,
                                                          color: ITheme.of(context).primary,
                                                          size: 24.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 24.0, 0.0),
                                                          child: Text(
                                                            'Uygulamaya Giriş Yap',
                                                            style: ITheme.of(context).bodyMedium.copyWith(
                                                                  fontFamily: 'Lexend',
                                                                  color: ITheme.of(context).primary,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Hesabın Var mı?',
                                                          style: ITheme.of(context).bodyMedium,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        onDispose: (viewModel) => viewModel.dispose());
  }
}
