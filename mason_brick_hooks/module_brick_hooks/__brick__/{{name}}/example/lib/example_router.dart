import 'package:flutter/material.dart';
import 'package:{{name}}/router/{{name.snakeCase()}}_router_mapping.dart';
import 'package:flutter_module_login/router/flutter_module_login_router_mapping.dart';
import 'package:{{name}}_example/splash_page.dart';
import 'package:module_base/common_export.dart';

class ExampleRouter {
  ExampleRouter._();

  static String main = "/";
}

final mainRouter = <String, WidgetBuilder>{
  ...GlobalManager.getInstance().routers,
  ...flutterModuleLoginRouter,
  ExampleRouter.main: (context) => const SplashPage(),
};
