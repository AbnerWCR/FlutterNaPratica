import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  String? username;
  String? password;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    onUpdate();
  }

  final formKey = GlobalKey<FormState>();

  final VoidCallback onSuccessLogin;
  final VoidCallback onUpdate;

  LoginController({required this.onSuccessLogin, required this.onUpdate});

  String? validateUsername(String? username) =>
      username != null && username.isNotEmpty ? null : "username can't be null";

  String? validatePassword(String? password) =>
      password != null && password.length >= 6
          ? null
          : "password must be 6 characters";

  void login() async {
    isLoading = true;
    UserCredential response;
    try {
      response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username!, password: password!);
      isLoading = false;

      if (response.user != null) {
        onSuccessLogin();
      }
    } 
    catch (e) {
      isLoading = false;
      print(e);
    }
  }

  bool validate() {
    final form = formKey.currentState!;

    if (form.validate()) {
      form.save();

      return true;
    }

    return false;
  }

  bool stringIsNullOrEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return false;
  }
}