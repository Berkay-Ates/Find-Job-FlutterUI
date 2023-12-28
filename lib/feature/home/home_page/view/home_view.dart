import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/core/components/job_widgets.dart';
import '../../../../core/base/view/base_view.dart';
import '../view_model/home_view_model.dart';
import '../../../../product/enums/home_post_enums.dart';

import '../../../../core/components/find_job_icon_button.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../notifications_page/view/notifications_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: HomeViewModel(),
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
                  "FindJob",
                  style: ITheme.of(context)
                      .headlineMedium
                      .copyWith(fontFamily: 'Lexend', color: ITheme.of(context).primaryText),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FindJobIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.notifications_none,
                        color: ITheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsView()));
                      },
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: viewModel.textController,
                      onChanged: null,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "İş ara",
                        labelStyle: ITheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: ITheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: ITheme.of(context).secondaryText,
                        ),
                      ),
                      style: ITheme.of(context).bodyMedium,
                      maxLines: 1,
                      validator: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Observer(builder: (_) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                            child: InkWell(
                              onTap: () => viewModel.changePostCategory(HomePostEnums.highPaid),
                              child: Text(
                                "Yüksek Maaşlı",
                                style: ITheme.of(context).titleSmall.copyWith(
                                      fontFamily: 'Lexend',
                                      color: viewModel.selectedPostCatgry == HomePostEnums.highPaid
                                          ? ITheme.of(context).primaryText
                                          : ITheme.of(context).secondaryText,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () => viewModel.changePostCategory(HomePostEnums.newest),
                                child: Text(
                                  "En Yeni",
                                  style: ITheme.of(context).bodyMedium.copyWith(
                                        fontFamily: 'Lexend',
                                        color: viewModel.selectedPostCatgry == HomePostEnums.newest
                                            ? ITheme.of(context).primaryText
                                            : ITheme.of(context).secondaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => viewModel.changePostCategory(HomePostEnums.popular),
                            child: Text(
                              "En Çok Başvurulan",
                              style: ITheme.of(context).bodyMedium.copyWith(
                                    fontFamily: 'Lexend',
                                    color: viewModel.selectedPostCatgry == HomePostEnums.popular
                                        ? ITheme.of(context).primaryText
                                        : ITheme.of(context).secondaryText,
                                  ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Observer(builder: (_) {
                        return viewModel.isloading
                            ? const Center(child: CircularProgressIndicator())
                            : viewModel.joblist?.isEmpty ?? false
                                ? Center(
                                    child: Text(
                                      "Gösterilecek hiç ilan yok",
                                      textAlign: TextAlign.center,
                                      style: ITheme.of(context).headlineSmall,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: viewModel.selectedPostCatgry == HomePostEnums.highPaid
                                        ? viewModel.joblist?.length
                                        : viewModel.selectedPostCatgry == HomePostEnums.newest
                                            ? viewModel.joblist?.length
                                            : viewModel.joblist?.length,
                                    padding: const EdgeInsets.only(bottom: 120),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return MyJobsWidget(
                                          title: viewModel.joblist?[index].title ?? "",
                                          description: viewModel.joblist?[index].description ?? "",
                                          application_count:
                                              viewModel.joblist?[index].application_count.toString() ?? "",
                                          salary: viewModel.joblist?[index].salary.toString() ?? "",
                                          applyJob: () {});
                                    },
                                  );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        onDispose: (viewModel) => viewModel.dispose());
  }
}
