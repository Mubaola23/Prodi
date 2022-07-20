import 'package:get/get.dart';
import 'package:prodi/src/features/authentication/views/login_screen.dart';

import '../../../core/utilities/base_change_notifier.dart';
import '../../../services/startup_service.dart';
import '../view/onboarding_screen.dart';

class SplashController extends BaseChangeNotifier {
  final startupService = Get.put(StartupService());

  @override
  void onInit() {
    decideNavigation();
    super.onInit();
  }

  // final FlutterSecureStorage _storage = FlutterSecureStorage();

  void decideNavigation() async {
    await Future.delayed(const Duration(seconds: 3));

    var onboardingViewed =
        await Get.find<StartupService>().readOnboardingViewed();
    String view = "true";
    print(onboardingViewed);

    if (onboardingViewed == view) {
      Get.off(() => const LoginScreen());
    } else {
      Get.off(() => OnboardingScreen());
    }
  }
}
