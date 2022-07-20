import 'package:get/get.dart';
import 'package:prodi/src/features/dashboard/views/dashboard_screen.dart';

import '../../../core/constants/app_user.dart';
import '../../../core/constants/failure.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';

class LoginController extends BaseChangeNotifier {
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

  AppUser? _appUser;
  AppUser? get appUser => _appUser;

  Future<void> login(
      {required String emailAddress, required String password}) async {
    try {
      setState(state: AppState.loading);

      _appUser =
          await authRepo.login(emailAddress: emailAddress, password: password);
      Get.offAll(() => DashBoardScreen(
            companyName: _appUser!.companyName,
          ));
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
