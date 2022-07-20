import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prodi/src/features/dashboard/views/add_product_screen.dart';
import 'package:prodi/src/features/dashboard/views/view_product%20screen.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/status_bar.dart';
import '../model/add_product.dart';

class AllProductsView extends StatefulWidget {
  final String title;
  final List<AddProduct>? product;

  const AllProductsView({Key? key, required this.title, required this.product})
      : super(key: key);

  @override
  _AllProductsViewState createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  // Widget appBarTitle =  Text(
  //   widget.title,
  //   style: TextStyle(color: Colors.white),
  // );
  Icon icon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

  // final controller = DashboardController();
  // List<AddProduct>? _list;
  late bool _isSearching;
  // String _searchText = "";
  List<AddProduct> searchresult = [];

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            isExtended: true,
            // foregroundColor: Colors.transparent,
            onPressed: () async {
              Get.to(() => widget.title == "Sold Products"
                  ? const AddSoldProducts()
                  : widget.title == "Processing Products"
                      ? const AddProcessingProducts()
                      : const AddProducts());
            },

            child: const Icon(
              Icons.add,
              color: AppColors.light,
            ),
          ),
          key: globalKey,
          appBar: AppBar(title: buildAppBar(context)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppSearchTextField(
                    controller: _controller,
                    label: "SERIAL No. / IME / Product ID",
                    // style:  TextStyle(
                    //   color: Colors.white,
                    // ),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),

                    onChanged: (searchText) => searchOperation(searchText),
                  ),
                ),
                Flexible(
                  child: searchresult.isNotEmpty || _controller.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchresult.length,
                          itemBuilder: (BuildContext context, int index) {
                            AddProduct listData = searchresult[index];
                            return listData.isBlank!
                                ? Text("no item")
                                : Card(
                                    child: ListTile(
                                      onTap: () => Get.to(() => ViewProduct(
                                            productName: listData.productName,
                                            productNo: listData.productNo,
                                            description: listData.description,
                                            createdBy: "",
                                            productID: listData.id,
                                          )),
                                      title: Text(
                                        listData.productName,
                                        style: heading2(context),
                                      ),
                                      isThreeLine: true,
                                      subtitle: Text(
                                        listData.productNo,
                                        style: heading4(context),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  );
                          },
                        )
                      : widget.product == null || widget.product!.isEmpty
                          ? Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.empty,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                    ),
                                    Text("No item")
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.product!.length,
                              itemBuilder: (BuildContext context, int index) {
                                AddProduct listData = widget.product![index];
                                return Card(
                                  child: ListTile(
                                    onTap: () => widget
                                                .product![index].processing ==
                                            true
                                        ? Get.to(() => ViewProcessingProduct(
                                              productName: listData.productName,
                                              productNo: listData.productNo,
                                              description: listData.description,
                                              createdBy: "",
                                              productID: listData.id,
                                            ))
                                        : widget.product![index].sold == true
                                            ? Get.to(() => ViewSoldProduct(
                                                  productName:
                                                      listData.productName,
                                                  productNo: listData.productNo,
                                                  description:
                                                      listData.description,
                                                  createdBy: "",
                                                  productID: listData.id,
                                                ))
                                            : Get.to(() => ViewProduct(
                                                  productName:
                                                      listData.productName,
                                                  productNo: listData.productNo,
                                                  description:
                                                      listData.description,
                                                  createdBy: "",
                                                  productID: listData.id,
                                                )),
                                    title: Text(
                                      listData.productName,
                                      style: heading2(context),
                                    ),
                                    // isThreeLine: true,
                                    subtitle: Text(
                                      listData.productNo,
                                      style: heading4(context),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(widget.title),
    );
  }

  // void _handleSearchStart() {
  //   setState(() {
  //     _isSearching = true;
  //   });
  // }

  // void _handleSearchEnd() {
  //   setState(() {
  //     icon = const Icon(
  //       Icons.search,
  //       color: Colors.white,
  //     );
  //     appBarTitle = Text(
  //       widget.title,
  //       style: TextStyle(color: Colors.white),
  //     );
  //     _isSearching = false;
  //     _controller.clear();
  //   });
  // }

  void searchOperation(String searchText) {
    searchresult.clear();

    if (_isSearching != null) {
      for (int i = 0; i < widget.product!.length; i++) {
        AddProduct data = widget.product![i];
        if (data.productNo.toLowerCase().contains(searchText.toLowerCase())) {
          setState(() {
            searchresult.add(data);
          });
        }
      }
    }
  }
}
