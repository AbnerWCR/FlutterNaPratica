// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  final formKey = GlobalKey<FormState>();

  String? validateUsername(String? username) =>
      username != null && username.isNotEmpty 
          ? null
          : "username can't be null";

  String? validatePassword(String? password) =>
      password != null && password.length >= 6
          ? null
          : "password must be 6 characters";

  bool login({required String username, required String password}) {
    print("Connecting to the server");
    print("welcome $username");
    print("Login");
    return true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Username"),
                validator: (value) => validateUsername(value),
                onSaved: (value) => username = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) => validatePassword(value),
                onSaved: (value) => password = value,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () {
                    if (validate()) {
                      login(username: username!, password: password!);
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
