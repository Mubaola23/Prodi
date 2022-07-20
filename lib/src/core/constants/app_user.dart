import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String companyName;
  final String emailAddress;
  final Timestamp createdAt;
  final String photoUrl;

  AppUser({
    required this.emailAddress,
    required this.companyName,
    required this.createdAt,
    required this.photoUrl,
  });

  factory AppUser.fromDocumentSnapshot(DocumentSnapshot snapshot) => AppUser(
      emailAddress: snapshot['emailAddress'] ?? '',
      companyName: snapshot['companyName'] ?? '',
      createdAt: snapshot['createdAt'] ?? '',
      photoUrl: snapshot['photoUrl']);
}
