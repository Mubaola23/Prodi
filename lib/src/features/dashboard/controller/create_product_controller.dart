import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/mobile_device_response.dart';
import 'package:prodi/src/features/dashboard/controller/dashboard_controller.dart';

import '../../../core/constants/failure.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/dashboard_repository.dart';

class CreateProductController extends BaseChangeNotifier {
  final dashboardRepo = Get.find<DashboardRepository>();
  final dashboardControl = Get.find<DashboardController>();
  List<String> mobileBrands = [];
  String? brandItem;

  onChanged(val) {
    brandItem = val;
    setState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/brands.json');
    final data = await json.decode(response);
    MobileDeviceResponse res = MobileDeviceResponse.fromJson(data);
    for (var items in res.results) {
      mobileBrands.add(items.cellPhoneBrand);
    }
    setState();
    print(mobileBrands.length);
// ...
  }

  onInit() {
    readJson();
    super.onInit();
  }

  Future createProduct(
    String productName,
    String productNo,
    String description,
  ) async {
    try {
      setState(state: AppState.loading);

      await dashboardRepo.addProduct(
        productName: productName,
        productNo: productNo,
        description: description,
        sold: false,
        processing: false,
      );
      await dashboardControl.getProducts();
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

  Future createProcessingProduct(
    String productName,
    String productNo,
    String description,
  ) async {
    try {
      setState(state: AppState.loading);

      await dashboardRepo.addProduct(
        productName: productName,
        productNo: productNo,
        description: description,
        sold: false,
        processing: true,
      );
      await dashboardControl.getProcessingProducts();
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

  Future createSoldProduct(
    String productName,
    String productNo,
    String description,
  ) async {
    try {
      setState(state: AppState.loading);

      await dashboardRepo.addProduct(
        productName: productName,
        productNo: productNo,
        description: description,
        sold: true,
        processing: false,
      );
      await dashboardControl.getSoldProducts();
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
