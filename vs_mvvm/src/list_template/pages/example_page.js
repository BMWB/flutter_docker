const myTemplate = `
import 'package:flutter/material.dart';
import 'package:habit/habit.dart';

import '../model/example_model.dart';
import '../viewmodel/example_viewModel.dart';

class ExampleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ExampleListViewModel>(
      create: (context) => ExampleListViewModel(ExampleListModel()),
      initViewModel: (context, vm) {
        vm.initData(context);
      },
      builder: (context, viewModel, child) {
        return ValueListenableListBuilder(
          valueListenables: [viewModel.items],
          builder: (BuildContext context, dynamic value, Widget? child) {
            return SizedBox();
          },
        );
      },
    );
  }
}
    `
    module.exports = myTemplate

