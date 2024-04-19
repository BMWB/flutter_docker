import 'package:flutter/material.dart';
import 'package:module_base/common_export.dart';
import 'package:{{name}}/generated/l10n.dart';
import 'package:{{name}}/router/{{name.snakeCase()}}_router_mapping.dart';
import 'package:{{name}}/src/di/injection_depend.config.dart';

class {{name.pascalCase()}}Aware extends ModuleAware {
  @override
  Future init() {
    return Future.value();
  }

  @override
  Future registerDependence({required GetIt it, String? env}) {
    $register{{name.pascalCase()}}Dependencies(it);
    return Future.value();
  }

  @override
  List<LocalizationsDelegate> registerLanguage() {
    return [S.delegate];
  }

  @override
  Map<String, WidgetBuilder> registerRouter() {
    return {{name.camelCase()}}Router;
  }
}
