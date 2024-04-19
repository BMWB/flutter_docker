import 'dart:io';

///
///  flutter_plugin_core.dart
///
/// @Author liuhuiliang
/// @Date 2023/4/28 15:30
///
/// @Description 执行创建AAR的命令相关
///
class FlutterPluginCore {
  /// 模块名称
  final String moduleName;

  /// 包名称
  final String packageName;

  FlutterPluginCore({required this.moduleName, required this.packageName});

  void doShellCreateAarProject() {
    final apkResult = Process.runSync(
        'flutter',
        [
          'create',
          '--org',
          '$packageName',
          '--template=plugin',
          '--platforms=android,ios',
          '-a',
          'kotlin',
          '$moduleName'
        ],
        runInShell: true);
    print('apkResult: ${apkResult.stdout}');
    print('apkResult: ${apkResult.stderr}');
  }
}
