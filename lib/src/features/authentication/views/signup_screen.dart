import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/utilities/base_change_notifier.dart';
import 'package:prodi/src/core/utilities/validation_mixin.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/user_params.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/status_bar.dart';
import '../controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final fullNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBar(
        child: SafeArea(
      child: GetBuilder<SignUpController>(
          init: SignUpController(),
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
                          "Create account",
                          style: heading1(context),
                        ),
                        SizedBox(
                          height: responsive24(context),
                        ),
                        AppTextField(
                          validator: (value) => context.validateFullName(value),
                          hintText: "Company Name",
                          label: "Company Name",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          controller: fullNameController,
                          // prefixIcon: const Icon(Icons.person),
                        ),
                        SizedBox(
                          height: responsive24(context),
                        ),
                        AppTextField(
                          validator: (value) =>
                              context.validateEmailAddress(value),
                          controller: emailController,
                          hintText: "abcd@gmail.com",
                          label: "Email",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          // prefixIcon: const Icon(Icons.alternate_email),
                        ),
                        SizedBox(
                          height: responsive24(context),
                        ),
                        AppTextField(
                          validator: (value) => context.validatePassword(value),
                          controller: passwordController,
                          hintText: "*******8",
                          label: "Password",
                          textInputAction: TextInputAction.done,
                          obscureText: controller.visibility,
                          // prefixIcon: const Icon(
                          //   Icons.shield_outlined,
                          //   // title: "khkb,jk",
                          // ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.visibility
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,

                              // title: "khkb,jk",
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
                                label: "Sign Up",
                                isLoading: controller.state.isLoading,
                                onPressed: () async {
                                  Get.focusScope?.unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    // if (!controller.checkBox) {
                                    //   Get.snackbar(
                                    //     '',
                                    //     'You must agree to terms and privacy policy',
                                    //     colorText:
                                    //         Get.theme.colorScheme.onError,
                                    //     backgroundColor: Get.theme.errorColor,
                                    //     snackPosition: SnackPosition.BOTTOM,
                                    //     margin: EdgeInsets.zero,
                                    //     borderRadius: 0,
                                    //   );
                                    //   return;
                                    // }
                                    await controller.signUp(
                                        params: UserParams(
                                            companyName:
                                                fullNameController.text,
                                            emailAddress:
                                                emailController.text.trim(),
                                            password: passwordController.text));
                                  }
                                }),
                            SizedBox(
                              height: responsive16(context),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "Already have an account? ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
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
}
