import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/constants/app_user.dart';

class FireStoreService {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<AppUser?> getUserWithId(String userId) async {
    final snapshot = await userCollection.doc(userId).get();
    return snapshot.exists ? AppUser.fromDocumentSnapshot(snapshot) : null;
  }

  Future<void> createUserWithId(
    String userId, {
    required String emailAddress,
    required String companyName,
    required String photoUrl,
  }) async {
    return await userCollection.doc(userId).set({
      'emailAddress': emailAddress,
      'companyName': companyName,
      'photoUrl': photoUrl,
      'createdAt': DateTime.now(),
    });
  }

  Future addProduct({
    required String productName,
    required String productNo,
    required String description,
  required bool processing,
    required bool sold,
    // required String date,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentReference reference =
        await userCollection.doc(user?.uid).collection('product').add({
      'productName': productName,
      'productNo': productNo,
      'description': description,
      'processing': processing,
      'sold': sold,
      'date': DateTime.now(),
    });

    DocumentSnapshot snapshot = await reference.get();
    return snapshot;
  }

  Future<dynamic> getAllProduct() async {
    User? user = FirebaseAuth.instance.currentUser;

    List<QueryDocumentSnapshot> snapshot =
        (await userCollection.doc(user?.uid).collection("product").get()).docs;

    return snapshot;
  }

  Future<void> changeProcessingStatus(String taskId, bool status) async {
    User? user = FirebaseAuth.instance.currentUser;

    return await userCollection
        .doc(user?.uid)
        .collection('product')
        .doc(taskId)
        .update(
      {
        'processing': status,
      },
    );
  }

  Future<void> changeSoldStatus(String taskId, bool status) async {
    User? user = FirebaseAuth.instance.currentUser;

    return await userCollection
        .doc(user?.uid)
        .collection('product')
        .doc(taskId)
        .update(
      {
        'sold': status,
      },
    );
  }

  Future getProcessingProducts() async {
    User? user = FirebaseAuth.instance.currentUser;

    List<QueryDocumentSnapshot> snapshot = (await userCollection
            .doc(user?.uid)
            .collection("product")
            .where('processing', isEqualTo: true)
            .get())
        .docs;
    print(snapshot.length);

    return snapshot;
  }

  Future getSoldProducts() async {
    User? user = FirebaseAuth.instance.currentUser;

    List<QueryDocumentSnapshot> snapshot = (await userCollection
            .doc(user?.uid)
            .collection("product")
            .where('sold', isEqualTo: true)
            .get())
        .docs;

    return snapshot;
  }
}
