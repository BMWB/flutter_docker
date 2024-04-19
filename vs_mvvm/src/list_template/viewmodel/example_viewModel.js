const myTemplate = `
import 'package:flutter/cupertino.dart';
import 'package:habit/life/base/paging/base_list_view_model.dart';
import 'package:habit/life/widget/paging/paging_load_callback.dart';
import 'package:module_base/common/colors.dart';

import '../model/example_model.dart';
import '../entity/example_entity.dart';

/// 负责人/执行人的ViewModel
class ExampleListViewModel extends BaseListViewModel<ExampleListModel, ExampleListEntity> {
  ExampleListViewModel(super.model);
  void initData(BuildContext context) {
    setAppBarTitle('Temp');
    setAppBarTitleColor(color_2A2F3C);
    setAppBarBackIconColor(color_2A2F3C);
    setAppBarElevation(0);
  }

  @override
  void loadData(int pageIndex, LoadCallback loadCallback) {}

  @override
  void showEmpty() {}
}

    `

    module.exports = myTemplate
