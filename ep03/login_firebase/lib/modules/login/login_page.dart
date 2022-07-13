import 'package:flutter/material.dart';
import 'package:login_firebase/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final controller = LoginController(
    onSuccessLogin: (() => Navigator.pushNamed(context, "/home")),
    onUpdate: (() => setState(() {}))
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Username"),
                      validator: (value) => controller.validateUsername(value),
                      onSaved: (value) => controller.username = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (value) => controller.validatePassword(value),
                      onSaved: (value) => controller.password = value,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (controller.error != null)
                      Text(
                        controller.error!,
                        style: TextStyle(color: Colors.red),
                      )
                    else if (controller.isLoading)
                      CircularProgressIndicator()
                    else
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                          ),
                          onPressed: () {
                            if (controller.validate()) {
                              controller.login();
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