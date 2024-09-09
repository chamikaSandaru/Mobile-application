import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/fetchdataFrom.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MuApp());
}

class MuApp extends StatelessWidget {
  const MuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: FetchDataFromFirebase(),
    );
  }
}
