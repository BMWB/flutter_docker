import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit/habit.dart';
import 'package:habit/life/constants/http_constants.dart';
import 'package:intl/src/intl_helpers.dart';
import 'package:module_base/config/language_cfg.dart';
import 'package:module_base/config/location_config.dart';
import 'package:module_base/constants/gender_const.dart';
import 'package:module_base/generated/l10n.dart' as A;
import 'package:module_base/l10n/vv_message_look_up.dart';
import 'package:module_base/router/navigator_helper.dart';
import 'package:oktoast/oktoast.dart';
import 'package:{{name}}/{{name}}.dart';
import 'package:{{name}}/generated/l10n.dart';
import 'package:{{name}}_example/example_router.dart';
import 'package:flutter_module_login/function/login/cache/login_manager.dart';
import 'package:module_base/common_export.dart';
import 'generated/main_module_lifecycle.dart';


void main() {
  tenantCode = "100000000";
  currentLanguage = "zh";
  WidgetsFlutterBinding.ensureInitialized();
  ModuleLifeExecutor(MainModuleGenerator()).doExecute();
  LoginManager.readTokenInfo();
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  messageLookup = VvMessageLookup();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _module = {{name.pascalCase()}}();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _module.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      radius: 4,
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (c, w) => MaterialApp(
          navigatorKey: globalNavigateKey,
          debugShowCheckedModeBanner: false,
          onGenerateTitle: generateAppLanguage(
              widget, "", (_) => LanguageZygote.initEmpty(_)),
          localizationsDelegates: GlobalManager.getInstance().localizationsDelegates,
          supportedLocales: const [Locale('zh', '')],
          routes: mainRouter,
          theme: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            primaryColor: Colors.blue,
            primarySwatch: Colors.indigo,
            fontFamily: 'PingFang SC',
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
              elevation: 1,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
