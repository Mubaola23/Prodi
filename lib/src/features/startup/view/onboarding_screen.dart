import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/widgets/spacing.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/status_bar.dart';
import '../controller/onboarding_controller.dart';
import '../model/onboarding_column.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  List<Widget> _buildPageIndicator(OnboardingController controller) {
    List<Widget> list = [];
    for (int i = 0; i < controller.numPages; i++) {
      list.add(
          i == controller.currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey[500],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.white),
      ),
    );
  }

  final List<OnboardingColumn> onboardingPages = <OnboardingColumn>[
    const OnboardingColumn(
      imgPath: AppImages.onboardind3,
      titletext: 'Bring innovation to you business',
    ),
    const OnboardingColumn(
      imgPath: AppImages.onboardind2,
      titletext: 'Store your products on cloud storage',
    ),
    const OnboardingColumn(
      imgPath: AppImages.onboardind1,
      titletext: 'Keep your record secured',
    ),
  ];
  //  const OnboardingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          builder: (controller) => Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Expanded(
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.onChangedFunction,
                  children: onboardingPages,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(controller),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: Dimensions.extraLarge),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.extraLarge,
                          vertical: Dimensions.extraLarge),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          SizedBox(
                            child: AppButton(
                              label: "Get Started",
                              onPressed: () async {
                                // await GetStorage()
                                //     .write("onboardingViewed", true);
                                Get.offAllNamed("/signup");
                              },
                            ),
                            width: 200,
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          // await Get.find<StartupService>()
                                          //     .writeOnboardingViewed();

                                          Get.offAllNamed("/login");
                                        },
                                      text: "Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: AppColors.primaryColor))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
