import 'package:flutter/material.dart';


class {{name.pascalCase()}}RouterMappingPath {
  static String index = "/{{name.snakeCase()}}RouterIndex";
  static String home = "/Home";

}


final {{name.camelCase()}}Router = <String, WidgetBuilder>{
 /// {{name.pascalCase()}}RouterMappingPath.home: (context) => const HomeMainPage(),
};