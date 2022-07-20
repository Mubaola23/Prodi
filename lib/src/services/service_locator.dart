import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../features/dashboard/controller/dashboard_controller.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/dashboard_repository.dart';

class ServicesLocator implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepository(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFunctions: FirebaseFunctions.instance),
        fenix: true);
    // Get.lazyPut<StartupService>(() => S);
    Get.lazyPut<DashboardRepository>(() => dashboardRepository, fenix: false);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
  }
}
