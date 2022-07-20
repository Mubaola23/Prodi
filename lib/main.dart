// ignore_for_file: non_constant_identifier_names

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/routes.dart';
import 'package:prodi/src/core/theme.dart';
import 'package:prodi/src/services/service_locator.dart';

import 'src/features/startup/view/splash.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(DevicePreview(
//       enabled: true,
//       tools: const [
//         ...DevicePreview.defaultTools,
//       ],
//       builder: (context) => const MyApp()));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialBinding: ServicesLocator(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      defaultTransition: Transition.fadeIn,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      // transitionDuration: const Duration(seconds: 1),
      theme: AppTheme.lightTheme,
      // defaultGlobalState: Get.defaultGlobalState,
      title: 'Flutter Demo',
      // initialRoute: "/",
      home: const SplashScreen(),

      onGenerateRoute: Routes.generateRoute,
    );
  }
}
