import 'package:flutter/material.dart';
import 'package:project/models/usermodel.dart';
import 'package:project/screen/authenticate/authenticate.dart';
import 'package:project/screen/home/data.dart';
import 'package:project/screen/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
