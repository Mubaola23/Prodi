import 'package:get/get.dart';

import '../../../core/constants/failure.dart';
import '../../../core/constants/user_params.dart';
import '../../../core/routes.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';

class SignUpController extends BaseChangeNotifier {
  final authRepo = Get.find<AuthenticationRepository>();
  bool _visibility = true;
  bool _checkBox = false;
  bool get visibility => _visibility;

  bool get checkBox => _checkBox;

  onChange() {
    _visibility = !_visibility;
    setState();
  }

  onChangeBox() {
    _checkBox = !_checkBox;
    setState();
  }

  Future<void> signUp({required UserParams params}) async {
    try {
      setState(state: AppState.loading);

      await authRepo.register(params: params);
      Get.offAllNamed(Routes.login);
    } on Failure catch (ex) {
      Get.back();
      Get.snackbar(
        'Error',
        ex.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }
}
