import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          print('Email is empty');
        } else {
          print('Email is $emailAddress');
        }

        if (password.isEmpty) {
          print('Password is empty');
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            print('User does not exists');
          }
          if (!credential.user!.emailVerified) {
            print('Email is not verified');
          }
          var user = credential.user;
          if (user != null) {
            print('User exists');
          } else {
            print('User does not exist');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }
    } catch (e) {
      //
    }
  }
}
