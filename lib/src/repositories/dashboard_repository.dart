import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prodi/src/core/constants/failure.dart';

import '../core/constants/app_user.dart';
import '../features/dashboard/model/add_product.dart';
import '../services/database/firestore_service.dart';

class DashboardRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FireStoreService fireStoreService = FireStoreService();

  User? get currentUser => firebaseAuth.currentUser;

  Future<AppUser?> getAuthenticatedUser() async {
    User? user = firebaseAuth.currentUser;

    return user != null ? await fireStoreService.getUserWithId(user.uid) : null;
  }

  //addProduct
  Future<AddProduct> addProduct({
    required String productName,
    required String productNo,
    required String description,
    required bool processing,
    required bool sold,
    // required String createdBy,
    // required String date,
  }) async {
    try {
      DocumentSnapshot snapshot = await fireStoreService.addProduct(
        productName: productName,
        productNo: productNo,
        description: description,
        processing: processing,
        sold: sold,
      );
      // User? user = FirebaseAuth.instance.currentUser;

      return AddProduct.fromDocumentSnapshot(snapshot);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  //change processing status
  Future<void> updateProcessingStatus(
      {required String productId, required bool status}) async {
    try {
      await fireStoreService.changeProcessingStatus(productId, status);
      // User? user = FirebaseAuth.instance.currentUser;

    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  //change sold status
  Future<void> updateSoldStatus(
      {required String productId, required bool status}) async {
    try {
      await fireStoreService.changeSoldStatus(productId, status);
      // User? user = FirebaseAuth.instance.currentUser;

    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  //get all product
  Future<List<AddProduct>> getProducts() async {
    try {
      List<DocumentSnapshot> snapshot = await fireStoreService.getAllProduct();
      // User? user = FirebaseAuth.instance.currentUser;
      List<AddProduct> products = [];
      for (var product in snapshot) {
        products.add(AddProduct.fromDocumentSnapshot(product));
      }
      return products;
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

//get all Processing product
  Future<List<AddProduct>> getProcessingProducts() async {
    try {
      List<DocumentSnapshot> snapshot =
          await fireStoreService.getProcessingProducts();
      // User? user = FirebaseAuth.instance.currentUser;
      List<AddProduct> products = [];
      for (var product in snapshot) {
        products.add(AddProduct.fromDocumentSnapshot(product));
      }
      return products;
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

//get all sold product

  Future<List<AddProduct>> getSoldProducts() async {
    try {
      List<DocumentSnapshot> snapshot =
          await fireStoreService.getSoldProducts();
      List<AddProduct> products = [];
      for (var product in snapshot) {
        products.add(AddProduct.fromDocumentSnapshot(product));
      }
      return products;
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }
}

final dashboardRepository = DashboardRepository();
