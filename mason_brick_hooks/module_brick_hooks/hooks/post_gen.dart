import 'dart:io';

import 'package:mason/mason.dart';
import 'package:process_run/process_run.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  final name = context.vars['name'];
  final dir = path.join(Directory.current.path, name);
  // await Shell().cd('''$packageName''');
  await Shell(workingDirectory: dir).run('''flutter pub get''');
  await Shell(workingDirectory: dir).run('''flutter pub upgrade''');
  await Shell(workingDirectory: dir).run('''flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/src/di/*"''');
  final exampleDir=path.join(dir, 'example');
  await Shell(workingDirectory: exampleDir).run('''flutter pub upgrade''');
  await Shell(workingDirectory: exampleDir).run('''flutter pub upgrade''');
  await Shell(workingDirectory: exampleDir).run('''boostrap''');
}
