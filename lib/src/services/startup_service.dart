import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StartupService {
  final box = const FlutterSecureStorage();

  Future<void> writeOnboardingViewed() async {
    await box.write(key: 'onboardingViewed', value: "true");
  }

  Future<String?> readOnboardingViewed() async {
    return await box.read(key: 'onboardingViewed');
  }
}
