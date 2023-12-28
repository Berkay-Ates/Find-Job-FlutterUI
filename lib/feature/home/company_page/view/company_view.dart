// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:placars_savt/core/base/view/base_view.dart';
import 'package:placars_savt/feature/home/company_page/view_model/messages_view_model.dart';

import '../../../../core/components/find_job_icon_button.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';

class CompanyView extends StatelessWidget {
  const CompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MessagesViewModel>(
        viewModel: MessagesViewModel(),
        onModelReady: ((viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        }),
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
                  "Şirketler",
                  style: ITheme.of(context).headlineMedium,
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
                        Icons.add,
                        color: ITheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        final response = await viewModel.navigateToCompanyAdd();
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
                  Observer(builder: (_) {
                    return viewModel.isLoading
                        ? const Expanded(child: Center(child: CircularProgressIndicator()))
                        : viewModel.recentlyMessged.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 300),
                                  SizedBox(
                                    height: 300,
                                    child: Text("Gösterilecek Hiç Şirket Yok!",
                                        style: ITheme.of(context).headlineSmall, textAlign: TextAlign.center),
                                  ),
                                ],
                              )
                            : const Expanded(child: Text("data"));
                  }),
                ],
              ),
            ),
          );
        });
  }
}
