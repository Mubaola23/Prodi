import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct {
  final String id;
  final String productName;
  final String productNo;
  final String description;
  final bool sold;
  final bool processing;
  // final Timestamp date;
  AddProduct({
    required this.id,
    required this.productNo,
    required this.productName,
    required this.description,
    required this.sold,
    required this.processing,

    // required this.date
  });

  factory AddProduct.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      AddProduct(
        id: snapshot.id,
        productName: snapshot['productName'],
        description: snapshot['description'],
        // date: Timestamp.,
        productNo: snapshot['productNo'], sold: snapshot['sold'],
        processing: snapshot['processing'],
      );
}
