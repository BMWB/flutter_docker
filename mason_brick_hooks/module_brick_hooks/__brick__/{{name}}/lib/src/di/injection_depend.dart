import 'package:module_base/common_export.dart';
import 'injection_depend.config.dart';
@InjectableInit(initializerName: r'$register{{name.pascalCase()}}Dependencies')
Future<GetIt> register{{name.pascalCase()}}Dependencies() async {
  return $register{{name.pascalCase()}}Dependencies(getIt);
}

