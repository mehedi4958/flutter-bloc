import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/values/constants.dart';
import 'package:flutter_block/common/widgets/flutter_toast.dart';
import 'package:flutter_block/global.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  const SignInController({required this.context});
  final BuildContext context;

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(message: 'Email is Empty');
          return;
        }

        if (password.isEmpty) {
          toastInfo(message: 'Password is Empty');
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(message: 'User does not exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(message: 'Email is not verified');
            return;
          }
          var user = credential.user;
          if (user != null) {
            Global.storageService
                .setString(AppConstants.storeUserTokenKey, '1234567890');
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            toastInfo(message: 'User does not exist');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            toastInfo(message: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            toastInfo(message: 'Invalid email');
          } else if (e.code == 'invalid-credential') {
            toastInfo(message: 'Invalid email or password');
          }
        }
      }
    } catch (e) {
      //
    }
  }
}
