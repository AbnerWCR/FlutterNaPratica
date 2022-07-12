import 'package:flutter/material.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    initialRoute: "/login",
    routes: {
      "/login": (BuildContext context) => LoginPage(),
      "/home":(BuildContext context) => HomePage()
    },
  );
  }
}