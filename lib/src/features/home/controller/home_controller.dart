import '../../../core/utilities/base_change_notifier.dart';

class HomeController extends BaseChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void onTabSelected(int index) {
    _currentPage = index;
    update();
  }
  // String _email = "";
  //
  //
  // String get email => _email;
}
