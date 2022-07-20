import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/utilities/base_change_notifier.dart';
import 'package:prodi/src/core/utilities/validation_mixin.dart';
import 'package:prodi/src/widgets/app_button.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/status_bar.dart';
import '../controller/create_product_controller.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final productNameController = TextEditingController();
  static final productNoController = TextEditingController();
  static final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Add item",
              style: heading2(context).copyWith(color: AppColors.light),
            ),
            automaticallyImplyLeading: true,
          ),
          body: GetBuilder<CreateProductController>(
              autoRemove: true,
              init: CreateProductController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: responsive32(context),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10, top: 30),
                            decoration: BoxDecoration(),
                            child: DropdownSearch(
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                hintText: "Phone Brand",
                                hintStyle: TextStyle(
                                    color: AppColors.dark,
                                    fontSize: responsive14(context)),
                                labelStyle: heading2(context),
                                border: InputBorder.none,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900, width: 1),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900, width: 1),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                              ),
                              validator: (val) {
                                if (val == null) {
                                  return "Choose a brand";
                                }
                              },
                              items: controller.mobileBrands,
                              onChanged: (val) => controller.onChanged(val),
                            ),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppTextField(
                            hintText: "SERIAL NO / IME",
                            label: "SERIAL NO / IME",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                context.validateFieldNotEmpty(value),
                            controller: productNoController,
                            // prefixIcon: const Icon(Icons.alternate_email),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppTextField(
                            hintText: "Description",
                            label: "Description",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                context.validateFieldNotEmpty(value),
                            controller: descriptionController,
                            // prefixIcon: const Icon(Icons.alternate_email),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppButton(
                            label: "Add Product",
                            isLoading: controller.state.isLoading,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                await controller.createProduct(
                                  controller.brandItem!,
                                  productNoController.text,
                                  descriptionController.text,
                                );

                                productNameController.clear();
                                productNoController.clear();
                                descriptionController.clear();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class AddProcessingProducts extends StatelessWidget {
  const AddProcessingProducts({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final productNameController = TextEditingController();
  static final productNoController = TextEditingController();
  static final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Add Processing item",
              style: heading2(context).copyWith(color: AppColors.light),
            ),
            automaticallyImplyLeading: true,
          ),
          body: GetBuilder<CreateProductController>(
              autoRemove: true,
              init: CreateProductController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: responsive32(context),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10, top: 30),
                            decoration: BoxDecoration(),
                            child: DropdownSearch(
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                hintText: "Phone Brand",
                                hintStyle: TextStyle(
                                    color: AppColors.dark,
                                    fontSize: responsive14(context)),
                                labelStyle: heading2(context),
                                border: InputBorder.none,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900, width: 1),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900, width: 1),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                              ),
                              validator: (val) {
                                if (val == null) {
                                  return "Choose a brand";
                                }
                              },
                              items: controller.mobileBrands,
                              onChanged: (val) => controller.onChanged(val),
                            ),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppTextField(
                            hintText: "SERIAL NO / IME",
                            label: "SERIAL NO / IME",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                context.validateFieldNotEmpty(value),
                            controller: productNoController,
                            // prefixIcon: const Icon(Icons.alternate_email),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppTextField(
                            hintText: "Description",
                            label: "Description",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                context.validateFieldNotEmpty(value),
                            controller: descriptionController,
                            // prefixIcon: const Icon(Icons.alternate_email),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppButton(
                            label: "Add",
                            isLoading: controller.state.isLoading,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                await controller.createProcessingProduct(
                                  controller.brandItem!,
                                  productNoController.text,
                                  descriptionController.text,
                                );

                                productNameController.clear();
                                productNoController.clear();
                                descriptionController.clear();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class AddSoldProducts extends StatelessWidget {
  const AddSoldProducts({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final productNameController = TextEditingController();
  static final productNoController = TextEditingController();
  static final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Add Sold item",
              style: heading2(context).copyWith(color: AppColors.light),
            ),
            automaticallyImplyLeading: true,
          ),
          body: GetBuilder<CreateProductController>(
              autoRemove: true,
              init: CreateProductController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: responsive32(context),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10, top: 30),
                            decoration: BoxDecoration(),
                            child: DropdownSearch(
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                hintText: "Phone Brand",
                                hintStyle: TextStyle(
                                    color: AppColors.dark,
                                    fontSize: responsive14(context)),
                                labelStyle: heading2(context),
                                border: InputBorder.none,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900, width: 1),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900, width: 1),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                              ),
                              validator: (val) {
                                if (val == null) {
                                  return "Choose a brand";
                                }
                              },
                              items: controller.mobileBrands,
                              onChanged: (val) => controller.onChanged(val),
                            ),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppTextField(
                            hintText: "SERIAL NO / IME",
                            label: "SERIAL NO / IME",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                context.validateFieldNotEmpty(value),
                            controller: productNoController,
                            // prefixIcon: const Icon(Icons.alternate_email),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppTextField(
                            hintText: "Description",
                            label: "Description",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                context.validateFieldNotEmpty(value),
                            controller: descriptionController,
                            // prefixIcon: const Icon(Icons.alternate_email),
                          ),
                          SizedBox(
                            height: responsive24(context),
                          ),
                          AppButton(
                            label: "Add",
                            isLoading: controller.state.isLoading,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                await controller.createSoldProduct(
                                  controller.brandItem!,
                                  productNoController.text,
                                  descriptionController.text,
                                );

                                productNameController.clear();
                                productNoController.clear();
                                descriptionController.clear();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
