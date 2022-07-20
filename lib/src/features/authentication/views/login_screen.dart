import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/utilities/base_change_notifier.dart';
import 'package:prodi/src/core/utilities/validation_mixin.dart';
import 'package:prodi/src/widgets/spacing.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/status_bar.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBar(
        child: SafeArea(
      child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.big, vertical: Dimensions.big),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: responsive100(context),
                        ),
                        Text(
                          "Login",
                          style: heading1(context),
                        ),
                        SizedBox(
                          height: responsive24(context),
                        ),
                        AppTextField(
                          hintText: "abcd@gmail.com",
                          label: "Email",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              context.validateEmailAddress(value),
                          controller: emailController,
                          prefixIcon: const Icon(Icons.alternate_email),
                        ),
                        SizedBox(
                          height: responsive24(context),
                        ),
                        AppTextField(
                          hintText: "*******8",
                          label: "Password",
                          validator: (value) => context.validatePassword(value),
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          obscureText: controller.visibility,
                          prefixIcon: const Icon(
                            Icons.shield_outlined,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.visibility
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () => controller.onChange(),
                          ),
                        ),
                        SizedBox(
                          height: responsive24(context),
                        ),
                        Column(
                          children: [
                            AppButton(
                                label: "Login",
                                isLoading: controller.state.isLoading,
                                onPressed: () async {
                                  Get.focusScope?.unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    await controller.login(
                                        emailAddress:
                                            emailController.text.trim(),
                                        password: passwordController.text);
                                  }
                                }),
                            SizedBox(
                              height: responsive16(context),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "New Here? ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            Get.offAllNamed("/signup");
                                          },
                                        text: "Sign Up",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: AppColors.primaryColor))
                                  ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ));
  }

  Widget signUpWith(BuildContext context,
      {required String img, required String text}) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.big,
            ),
            child: Text(
              text,
              style: heading4(context).copyWith(color: AppColors.primaryColor),
            ),
          ),
          SvgPicture.asset(
            img,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget biometrics(BuildContext context,
      {required String img, required String text}) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.big,
            ),
            child: Text(
              text,
              style:
                  heading4(context).copyWith(color: AppColors.secondaryColor),
            ),
          ),
          SvgPicture.asset(img, placeholderBuilder: (context) => Text("error")),
        ],
      ),
    );
  }
}
