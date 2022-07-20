import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodi/src/core/utilities/base_change_notifier.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/status_bar.dart';
import '../controller/dashboard_controller.dart';
import 'all_product_view.dart';

class DashBoardScreen extends StatelessWidget {
  final String companyName;
  const DashBoardScreen({
    Key? key,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<DashboardController>(
              // autoRemove: true,
              init: DashboardController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.big,
                  ),
                  child:
                      // controller.state == AppState.loading
                      //     ? const Center(child: CircularProgressIndicator())
                      //     :
                      Column(
                    children: [
                      _header(context, companyName),
                      SizedBox(
                        height: responsive8(context),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        color: AppColors.primaryColor,
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Processing",
                                  style: heading2(context)
                                      .copyWith(color: AppColors.light),
                                ),
                                controller.state.isLoading
                                    ? Text(
                                        "...",
                                        style: heading2(context)
                                            .copyWith(color: AppColors.light),
                                      )
                                    : controller.processingProducts == null
                                        ? Text(
                                            "0",
                                            style: heading2(context).copyWith(
                                                color: AppColors.light),
                                          )
                                        : Text(
                                            controller
                                                .processingProducts!.length
                                                .toString(),
                                            style: heading1(context).copyWith(
                                                color: AppColors.light),
                                          ),
                              ],
                            ),
                            Container(
                              width: 3,
                              height: 60,
                              color: Colors.white54,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sold",
                                  style: heading2(context)
                                      .copyWith(color: AppColors.light),
                                ),
                                controller.state.isLoading
                                    ? Text(
                                        "...",
                                        style: heading2(context)
                                            .copyWith(color: AppColors.light),
                                      )
                                    : controller.soldProducts == null
                                        ? Text(
                                            "0",
                                            style: heading2(context).copyWith(
                                                color: AppColors.light),
                                          )
                                        : Text(
                                            controller.soldProducts!.length
                                                .toString(),
                                            style: heading1(context).copyWith(
                                                color: AppColors.light),
                                          ),
                              ],
                            ),
                            Container(
                              width: 3,
                              height: 60,
                              color: Colors.white54,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total",
                                  style: heading2(context)
                                      .copyWith(color: AppColors.light),
                                ),
                                controller.state.isLoading
                                    ? Text(
                                        "...",
                                        style: heading2(context)
                                            .copyWith(color: AppColors.light),
                                      )
                                    : controller.products == null
                                        ? Text(
                                            "0",
                                            style: heading2(context).copyWith(
                                                color: AppColors.light),
                                          )
                                        : Text(
                                            controller.products!.length
                                                .toString(),
                                            style: heading1(context).copyWith(
                                                color: AppColors.light),
                                          ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      productSnapshot(controller),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  _header(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.big),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back,\n",
            softWrap: true,
            maxLines: 1,
            style: heading2(context),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "$name".toUpperCase(),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: heading1(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget productSnapshot(DashboardController dashboardController) {
    return Column(
      children: [
        Card(
          child: ListTile(
            onTap: () => Get.to(
              () => AllProductsView(
                  title: "Processing Products",
                  product: dashboardController.processingProducts),
            ),
            title: const Text('Processing'),
          ),
        ),
        const SizedBox(
          height: Dimensions.medium,
        ),
        Card(
          child: ListTile(
            onTap: () => Get.to(
              () => AllProductsView(
                  title: "Sold Products",
                  product: dashboardController.soldProducts),
            ),
            title: const Text('Sold out '),
          ),
        ),
        const SizedBox(
          height: Dimensions.medium,
        ),
        Card(
          child: ListTile(
            onTap: () => Get.to(
              () => AllProductsView(
                  title: "All Products", product: dashboardController.products),
            ),
            title: Text('All Product'),
          ),
        ),
      ],
    );
  }
}
