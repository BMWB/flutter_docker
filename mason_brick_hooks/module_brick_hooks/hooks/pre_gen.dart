import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml_edit/yaml_edit.dart';

import 'flutter_plugin_core.dart';

void run(HookContext context) async {
  final moduleName = context.vars['name'];
  final packageName = context.vars['pckName'];
  // print('Directory.current.path:${Directory.current.path}');
  // print('this is name:$moduleName,this is name:$packageName');
  FlutterPluginCore(packageName: packageName, moduleName: moduleName).doShellCreateAarProject();
  File(context.exampleMainPath).deleteSync();
  changePubSpecDependencies(context);
  changeExamplePubSpecDependencies(context);
}

void changePubSpecDependencies(HookContext context) {
  File(context.moduleYamlPath).readAsString().then((value) {
    final yamlEditor = YamlEditor(value);
    yamlEditor.update(
      ['dependencies'],
      {
        // 'flutter': {'sdk': 'flutter'},
        // 'plugin_platform_interface': '^2.0.2',
        // 'habit': '^0.0.1',
        // 'module_base': '^0.0.1',
      },
    );
    yamlEditor.update([
      'dev_dependencies'
    ], {
      // 'flutter_test': {'sdk': 'flutter'},
      // 'flutter_lints': '^2.0.0',
      // 'injectable_generator': '^1.5.4',
      // 'build_runner': '^2.1.7',
    });
    File(context.moduleYamlPath).writeAsStringSync(yamlEditor.toString());
  });
}

///
/// description 对yaml文件进行修改
///
/// [context] 上下文对象信息
///
void changeExamplePubSpecDependencies(HookContext context) {
  File(context.exampleYamlPath2).readAsString().then((value) {
    final yamlEditor = YamlEditor(value);
    yamlEditor.update(
      ['dev_dependencies'],
      {
        // 'flutter_test': {'sdk': 'flutter'},
        // 'plugin_platform_interface': '^2.0.2',
        // 'flutter_module_login': '^0.0.1',
        // 'injectable_generator': '^1.5.4',
        // 'build_runner': '^2.1.7',
      },
    );
    File(context.exampleYamlPath2).writeAsStringSync(yamlEditor.toString());
  });
}

extension PluginFactoryExtension on HookContext {
  ///
  /// 获取yaml文件的路径
  ///
  String get moduleYamlPath => Directory.current.path + "/" + this.vars['name'] + '/pubspec.yaml';

  ///
  ///  获取example/main文件的路径
  ///
  String get exampleMainPath => Directory.current.path + "/" + this.vars['name'] + '/example/lib/main.dart';

  ///
  ///  获取example/splash文件的路径
  ///
  String get splashPath => Directory.current.path + "/" + this.vars['name'] + '/lib/splash.dart';

  ///
  ///  获取example/splash文件的路径
  ///
  String get exampleYamlPath2 => Directory.current.path + "/" + this.vars['name'] + '/example/pubspec.yaml';
}
