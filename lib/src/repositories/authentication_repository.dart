import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/constants/app_user.dart';
import '../core/constants/failure.dart';
import '../core/constants/user_params.dart';
import '../services/database/firestore_service.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required this.firebaseAuth,
    required this.firebaseFunctions,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFunctions firebaseFunctions;
  FireStoreService fireStoreService = FireStoreService();

  User? get currentUser => firebaseAuth.currentUser;

  Future<AppUser?> getAuthenticatedUser() async {
    User? user = firebaseAuth.currentUser;

    return user != null ? await fireStoreService.getUserWithId(user.uid) : null;
  }

  Future<dynamic> register({required UserParams params}) async {
    try {
      final UserCredential _userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );

      try {
        // await _userCredential.user?.sendEmailVerification();
        await fireStoreService.createUserWithId(
          _userCredential.user!.uid,
          emailAddress: params.emailAddress,
          companyName: params.companyName,
          photoUrl: '',
        );

        return await fireStoreService.getUserWithId(_userCredential.user!.uid);
      } catch (ex) {
        await _userCredential.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  Future<AppUser?> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      // final UserCredential _userCredential =
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      AppUser? _user = await getAuthenticatedUser();
      return _user;
      // if (_userCredential.user!.emailVerified) {
      //   String userId = _userCredential.user!.uid;
      //   return await fireStoreService.getUserWithId(userId);
      // } else {
      //   await _userCredential.user?.sendEmailVerification();
      //   throw Failure(
      //       'User email not verified, Verification link has been sent to your email');
      // }
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }
}

final authRepository = AuthenticationRepository(
  firebaseAuth: FirebaseAuth.instance,
  firebaseFunctions: FirebaseFunctions.instance,
);
