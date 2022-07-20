import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/constants/app_textstyles.dart';

import '../../../core/constants/colors.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Scaffold(
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PRODI ",
                      style: heading1(context).copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      color: AppColors.primaryColor,
                      child: Text(
                        "APP",
                        style: heading1(context).copyWith(
                            color: AppColors.light,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
