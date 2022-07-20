import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/startup_service.dart';

class OnboardingController extends GetxController {
  int _currentIndex = 0;
  final int _numPages = 3;
  PageController? _pageController;

  int get currentIndex => _currentIndex;
  int get numPages => _numPages;
  PageController? get pageController => _pageController;
  bool _switchModeValue = false;
  late Timer? _pageAnimationTimer;

  void _animateSlides() {
    if (_pageController == null) return;
    if (currentIndex < 4) {
      _pageController?.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void onInit() async {
    _pageAnimationTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _animateSlides();
    });
    _pageController = PageController();
    await Get.find<StartupService>().writeOnboardingViewed();

    super.onInit();
  }

  @override
  void onClose() {
    _pageAnimationTimer?.cancel();

    _pageController?.dispose();
    _pageAnimationTimer = null;
    super.dispose();
  }

  void onChangedFunction(int index) {
    _currentIndex = index;

    update();
  }
}
