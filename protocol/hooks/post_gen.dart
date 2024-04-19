
import 'package:mason/mason.dart';
import 'package:process_run/process_run.dart';


void run(HookContext context) async{
  final moduleName = context.vars['name'];
  final shell = await Shell().cd("packages").run(
      '''flutter create --template=package ${moduleName}_protocol''');
}




