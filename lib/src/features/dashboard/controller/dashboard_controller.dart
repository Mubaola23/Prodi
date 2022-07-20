import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prodi/src/features/dashboard/model/add_product.dart';

import '../../../core/constants/app_user.dart';
import '../../../core/constants/failure.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/dashboard_repository.dart';

class DashboardController extends BaseChangeNotifier {
  final authRepo = Get.find<AuthenticationRepository>();

  final dashboardRepo = Get.find<DashboardRepository>();

  @override
  onInit() {
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepository(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFunctions: FirebaseFunctions.instance),
        fenix: true);
    getProducts();
    getSoldProducts();
    getProcessingProducts();

    super.onInit();
  }

  List<AddProduct>? _products;
  List<AddProduct>? get products => _products;

  List<AddProduct>? _processingProducts;
  List<AddProduct>? get processingProducts => _processingProducts;

  List<AddProduct>? _soldProducts;
  List<AddProduct>? get soldProducts => _soldProducts;

  final List<AddProduct>? _searchResult = [];
  List<AddProduct>? get searchResult => _searchResult;

  AppUser? _appUser;
  AppUser? get appUser => _appUser;

  void searchOperation(String searchText) {
    searchResult?.clear();

    print(searchText);
    print(_products?.length);
    for (int i = 0; i < _products!.length; i++) {
      AddProduct? data = _products?[i];
      if (data!.productNo
          .trim()
          .toLowerCase()
          .contains(searchText.toLowerCase())) {
        _searchResult!.add(data);
      }
    }
  }

  void getAuthenticatedUser() async {
    setState(state: AppState.loading);
    try {
      _appUser = await authRepo.getAuthenticatedUser();
      setState(state: AppState.idle);
    } on Failure catch (ex) {
      setState(state: AppState.idle);
      Get.snackbar(
        'Error',
        ex.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //get all product
  Future getProducts() async {
    try {
      setState(state: AppState.loading);

      _products = await dashboardRepo.getProducts();
      setState(state: AppState.idle);
    } on Failure catch (f) {
      Get.snackbar(
        'Error',
        f.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }

  //get all Processing product
  Future getProcessingProducts() async {
    try {
      setState(state: AppState.loading);

      _processingProducts = await dashboardRepo.getProcessingProducts();
      setState();
    } on Failure catch (f) {
      Get.snackbar(
        'Error',
        f.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }

  //get all Sold product
  Future getSoldProducts() async {
    try {
      setState(state: AppState.loading);

      _soldProducts = await dashboardRepo.getSoldProducts();
      setState();
    } on Failure catch (f) {
      Get.snackbar(
        'Error',
        f.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }

  FutureOr onGoBack(dynamic value) async {
    getProducts();
    update();
  }

  //change processing status
  Future processing({required String productId, required bool status}) async {
    try {
      setState(state: AppState.loading);
      Get.defaultDialog(
        title: 'Updating...',
        middleText: 'Please Wait',
        barrierDismissible: false,
      );
      await dashboardRepo.updateProcessingStatus(
          productId: productId, status: status);
      await getProducts();

      await getProcessingProducts();
      Get.back();
      Get.back();
      Get.back();
      setState();
    } on Failure catch (f) {
      Get.snackbar(
        'Error',
        f.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }

  //change sold status
  Future sold({required String productId, required bool status}) async {
    try {
      setState(state: AppState.loading);
      Get.defaultDialog(
        title: 'Updating...',
        middleText: 'Please Wait',
        barrierDismissible: false,
      );
      await dashboardRepo.updateSoldStatus(
          productId: productId, status: status);
      await getProducts();

      await getSoldProducts();
      Get.back();
      Get.back();
      Get.back();
    } on Failure catch (f) {
      Get.snackbar(
        'Error',
        f.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }
}
