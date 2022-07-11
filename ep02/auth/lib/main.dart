// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    initialRoute: "/login",
    routes: {
      "/login": (BuildContext context) => LoginPage(),
      "/home":(BuildContext context) => HomePage()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: const Text("Login successful!"),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  String? validateUsername(String? username) =>
      username != null && username.isNotEmpty ? null : "username can't be null";

  String? validatePassword(String? password) =>
      password != null && password.length >= 6
          ? null
          : "password must be 6 characters";

  void login({required String username, required String password}) async {
    isLoading = true;

    setState(() {});

    final response = await apiLogin(username: username, password: password);
    isLoading = false;

    setState(() {});

    if (response) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/home");
      print("Welcome to HomePage");
    }
  }

  Future<bool> apiLogin(
      {required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 4));
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
                    if (isLoading)
                      CircularProgressIndicator()
                    else
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
