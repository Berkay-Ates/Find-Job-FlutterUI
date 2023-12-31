import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/home/company_page/view/company_view.dart';
import 'package:placars_savt/feature/home/job_applications_page/view/my_job_applications.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../product/enums/tab_enums.dart';
import '../../home_page/view/home_view.dart';

import '../../settings_page/view/user_settings_view.dart';

part 'tab_view_model.g.dart';

class PlacarsTabViewModel = _PlacarsTabViewModelBase with _$PlacarsTabViewModel;

abstract class _PlacarsTabViewModelBase with Store, BaseViewModel {
  TabController? tabController;

  String currentPageName = TabEnums.home.name;
  late Widget? currentPage;

  @observable
  int currentIndex = 0;

  final tabs = {
    TabEnums.home.name: const HomeView(),
    TabEnums.mycars.name: const CarsView(),
    TabEnums.messages.name: const CompanyView(),
    TabEnums.user.name: const UserSettingsView(),
  };

  @action
  void setCurrentPageIndex(int i) {
    currentIndex = i;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}
}
