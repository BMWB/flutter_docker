import 'package:flutter/material.dart';
import 'package:{{name}}/router/{{name.snakeCase()}}_router_mapping.dart';
import 'package:flutter_module_login/router/flutter_module_login_router_mapping.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能调试"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(FlutterModuleLoginRouterMappingPath.loginPage),
              child: const Text("跳转登录"),
            ),
          ],
        ),
      ),
    );
  }
}
