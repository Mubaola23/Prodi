import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:prodi/src/widgets/app_button.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/status_bar.dart';

class ViewProduct extends StatelessWidget {
  final String productName;
  final String productNo;
  final String description;
  final String createdBy;
  final String productID;

  const ViewProduct(
      {Key? key,
      required this.productName,
      required this.productNo,
      required this.description,
      required this.createdBy,
      required this.productID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = DashboardController().;
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("Product"),
          ),
          body: GetBuilder<DashboardController>(
              init: DashboardController(),
              builder: (controller) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Name: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(productName.toUpperCase())),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Serial/IME No: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(productNo)),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Description: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(description)),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "Created by: ",
                        //       style: heading2(context),
                        //     ),
                        //     Expanded(child: Text(createdBy.toUpperCase())),
                        //   ],
                        // ),
                        SizedBox(
                          height: responsive100(context),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: AppButton(
                                label: "Processing",
                                onPressed: () async =>
                                    await controller.processing(
                                        productId: productID, status: true),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: AppButton(
                                label: "Sold",
                                onPressed: () async => await controller.sold(
                                    productId: productID, status: true),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class ViewProcessingProduct extends StatelessWidget {
  final String productName;
  final String productNo;
  final String description;
  final String createdBy;
  final String productID;

  const ViewProcessingProduct(
      {Key? key,
      required this.productName,
      required this.productNo,
      required this.description,
      required this.createdBy,
      required this.productID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: const Text("Processing"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GetBuilder<DashboardController>(
                  init: DashboardController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Name: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(productName.toUpperCase())),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Serial/IME No: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(productNo)),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Description: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(description)),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Status: ",
                              style: heading2(context),
                            ),
                            const Expanded(child: Text("Processing")),
                          ],
                        ),
                        SizedBox(
                          height: responsive100(context),
                        ),
                        AppButton(
                          label: "Completed",
                          onPressed: () async => await controller.processing(
                              productId: productID, status: false),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class ViewSoldProduct extends StatelessWidget {
  final String productName;
  final String productNo;
  final String description;
  final String createdBy;
  final String productID;
  const ViewSoldProduct({
    Key? key,
    required this.productName,
    required this.productNo,
    required this.description,
    required this.createdBy,
    required this.productID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("Sold"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GetBuilder<DashboardController>(
                  init: DashboardController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Name: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(productName.toUpperCase())),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Serial/IME No: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(productNo)),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Description: ",
                              style: heading2(context),
                            ),
                            Expanded(child: Text(description)),
                          ],
                        ),
                        SizedBox(
                          height: responsive8(context),
                        ),
                        Row(
                          children: [
                            Text(
                              "Status: ",
                              style: heading2(context),
                            ),
                            const Expanded(child: Text("Sold")),
                          ],
                        ),
                        SizedBox(
                          height: responsive100(context),
                        ),
                        AppButton(
                          label: "Undo sold",
                          onPressed: () async => await controller.sold(
                              productId: productID, status: false),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
