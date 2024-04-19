const myTemplate = `
import 'package:flutter/cupertino.dart';
import 'package:habit/life/base/view_model_provider.dart';
import 'package:habit/life/widget/base/base_appbar_widget.dart';
import 'package:habit/life/widget/base/base_scaffold.dart';

import '../model/example_model.dart';
import '../viewmodel/example_viewmodel.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: (create) => ExampleViewModel(ExampleModel()),
      initViewModel: (context, viewModel) {
        viewModel.initData();
      },
      builder: (context, viewModel, child) {
        return BaseScaffold(
            toolBar: AppBarWidget(viewModel),
            body: Stack(
              children: const [SizedBox()],
            ),
            viewModel: viewModel);
      },
    );
  }
}
    `

    module.exports = myTemplate
