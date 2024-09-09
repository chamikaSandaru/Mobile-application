import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String realTimeValue = '0';
  String getOncevalues = '0';
  String cont = '0';
  final nameContraller = TextEditingController();
  final emailContraller = TextEditingController();
  final ageContraller = TextEditingController();
  final heightContraller = TextEditingController();
  final wheightContraller = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: FutureBuilder(
        future: _fApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something wrong with firebase"));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return content();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget content() {
    DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('count');
    _testRef.onValue.listen(
      (event) {
        setState(() {
          realTimeValue = event.snapshot.value.toString();
        });
      },
    );
    DatabaseReference _testRef1 =
        FirebaseDatabase.instance.ref().child('count1');
    _testRef1.onValue.listen((event) {
      setState(() {
        getOncevalues = event.snapshot.value.toString();
      });
    });
    DatabaseReference _testRef2 =
        FirebaseDatabase.instance.ref().child('cont2');
    _testRef2.onValue.listen((event) {
      setState(() {
        cont = event.snapshot.value.toString();
      });
    });

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Real time Counter : $realTimeValue",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Get once",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text("Get once counter : $getOncevalues"),
            ),
            Center(
              child: Text("me mn dpu value ekak: $cont"),
            ),
            TextField(
              controller: nameContraller,
              decoration: const InputDecoration(hintText: 'name'),
            ),
            TextField(
              controller: emailContraller,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            TextField(
              controller: ageContraller,
              decoration: const InputDecoration(hintText: 'age'),
            ),
            TextField(
              controller: heightContraller,
              decoration: const InputDecoration(hintText: 'height'),
            ),
            TextField(
              controller: wheightContraller,
              decoration: const InputDecoration(hintText: 'weight'),
            ),
            ElevatedButton(
              onPressed: () {
                CollectionReference collRef =
                    FirebaseFirestore.instance.collection('users');
                collRef.add({
                  'age': ageContraller.text,
                  'email': emailContraller.text,
                  'name': nameContraller.text,
                  'height': heightContraller.text,
                  'weight': wheightContraller.text,
                });
              },
              child: const Text('Add users'),
            ),
            ElevatedButton(
              onPressed: () {
                CollectionReference collref =
                    FirebaseFirestore.instance.collection('client');
                collref.add({
                  'age': ageContraller.text,
                  'height': heightContraller.text,
                  'name': nameContraller.text,
                  'weight': wheightContraller.text,
                });
              },
              child: const Text('Add data to client'),
            ),
            ElevatedButton(
              onPressed: () {
                CollectionReference collref =
                    FirebaseFirestore.instance.collection('example');
                collref.add({
                  'age': ageContraller.text,
                  'height': heightContraller.text,
                  'name': nameContraller.text,
                  'weight': wheightContraller.text,
                });
              },
              child: const Text('Add data to example'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => register()));
            //   },
            //   child: Text('Go to register page'),
            // ),
          ],
        ),
      ),
    );
  }
}
