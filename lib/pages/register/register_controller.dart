import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/widgets/flutter_toast.dart';
import 'package:flutter_block/pages/register/bloc/register_blocs.dart';

class RegisterController {
  RegisterController({required this.context});
  final BuildContext context;

  void handleEmailRegistration() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(message: 'User name cannot be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: 'Email cannot be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: 'Password cannot be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: 'Confirm password cannot be empty');
      return;
    }

    if (password != rePassword) {
      toastInfo(message: 'Password and confirm password mismatch');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
          message:
              'An email has been sent to your account. Please login to your email to authenticate.',
        );
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'Your password is weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'An account with this email already exits.');
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'Invalid email');
      }
    }
  }
}
