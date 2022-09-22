import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/auth/screens/otp_screen.dart';
import 'package:to_do/features/auth/screens/user_info_screen.dart';
import 'package:to_do/features/todo/todo_screens/todo_screen.dart';
import 'package:to_do/model/user_model.dart';

final authRepoProvider = Provider(((ref) => AuthRepo(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance)));

class AuthRepo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRepo({required this.firebaseAuth, required this.firebaseFirestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (e) {},
          verificationFailed: (e) {},
          codeSent: ((verificationId, forceResendingToken) async {
            Navigator.pushNamed(context, OtpScreen.routeName,
                arguments: verificationId);
          }),
          codeAutoRetrievalTimeout: ((verificationId) {}));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      await firebaseAuth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInfoScreen.route, (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void saveUserDataToFirebase(
      {required String name,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      var user = UserModel(
          name: name,
          uid: uid,
          phoneNumber: firebaseAuth.currentUser!.phoneNumber.toString());

      await firebaseFirestore.collection('users').doc(uid).set(user.toMap());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TodoScreen()),
          (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
