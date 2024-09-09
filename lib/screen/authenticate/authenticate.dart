import 'package:flutter/material.dart';
import 'package:project/screen/authenticate/register.dart';
import 'package:project/screen/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool Sign_InPage = true;

  void switchPages() {
    setState(() {
      Sign_InPage = !Sign_InPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Sign_InPage == true) {
      return Sign_In(
        toggle: switchPages,
      );
    } else {
      return Register(
        toggle: switchPages,
      );
    }
  }
}
