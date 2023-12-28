// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/core/base/view/base_view.dart';
import 'package:placars_savt/core/components/car_delete_widget.dart';
import 'package:placars_savt/core/constants/durations/app_durations.dart';
import 'package:placars_savt/core/extension/device_properties/device_properties.dart';
import 'package:placars_savt/feature/home/job_applications_page/view_model/my_cars_view_model.dart';

import '../../../../core/components/my_cars_widgets.dart';

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
                    : viewModel.carLists.isEmpty
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
                              return MyCarsWidget(
                                imgUrl: viewModel.carLists[index].carPhotoUrl ?? viewModel.carUrl,
                                plate: viewModel.carLists[index].carPlate ?? "Plaka yok",
                                description: viewModel.carLists[index].carDescription ?? "Description yok",
                                isSale: (viewModel.carLists[index].isCarSale ?? false),
                                km: "${viewModel.carLists[index].carKm} km",
                                model: viewModel.carLists[index].carBrand ?? " ",
                                deleteCar: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: const Color(0x00FFFFFF),
                                    enableDrag: false,
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                        child: SizedBox(
                                          height: 187.0,
                                          child: CarDeleteWidget(
                                            deleteCar: () async {
                                              await Future.delayed(AppDurations.durationLarge);
                                              viewModel.changeItemCount();
                                              viewModel.popDeleteWidget();
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onCarTopped: () {
                                  inspect(index);
                                  viewModel.navigateToUserSelfCarPost(viewModel.carLists[index]);
                                },
                              );
                            },
                            itemCount: viewModel.carLists.length,
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
