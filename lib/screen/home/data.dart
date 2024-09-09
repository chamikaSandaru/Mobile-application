import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/color.dart';
import 'package:project/constants/style.dart';
import 'package:project/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Regis(toggle: yourToggleFunction), // Set the initial widget here
    );
  }

  void yourToggleFunction() {
    // Implement the functionality to toggle between login and register screens
  }
}

class Regis extends StatefulWidget {
  final Function toggle;
  const Regis({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Regis> createState() => Register();
}

class Register extends State<Regis> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  final nameConrealler = TextEditingController();
  final heightContraller = TextEditingController();
  final weightContraller = TextEditingController();
  final emailContraller = TextEditingController();
  final passwordContraller = TextEditingController();
  final ageContraller = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 145, 217, 250),
      appBar: AppBar(
        title: Text(
          "Register",
          style: topic.copyWith(
              color: Colors.black), // Changed text color to black
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 83, 125),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "If you haven't account. You can register here",
                style: des.copyWith(
                  color: Color.fromARGB(255, 11, 22, 73),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ), // Changed text color to black
              ),
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextField(
                        controller: nameConrealler,
                        style: TextStyle(
                            color: Colors.black), // Changed text color to black
                        decoration: tID.copyWith(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextFormField(
                        controller: emailContraller,
                        style: TextStyle(
                            color: Colors.black), // Changed text color to black
                        decoration: tID.copyWith(
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter Email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        controller: passwordContraller,
                        style: TextStyle(
                            color: Colors.black), // Changed text color to black
                        decoration: tID.copyWith(
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (val) =>
                            val!.length < 6 ? "Enter Password" : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      TextField(
                        controller: ageContraller,
                        style: TextStyle(
                            color: Colors.black), // Changed text color to black
                        decoration: tID.copyWith(
                          hintText: "Age",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextField(
                        controller: heightContraller,
                        style: TextStyle(
                            color: Colors.black), // Changed text color to black
                        decoration: tID.copyWith(
                          hintText: "Height",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextField(
                        controller: weightContraller,
                        style: TextStyle(
                            color: Colors.black), // Changed text color to black
                        decoration: tID.copyWith(
                          hintText: "Weight",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(error, style: TextStyle(color: Colors.red)),
                      Text(
                        "Login with social account",
                        style: des.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ), // Changed text color to black
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            'assets/gmail.png',
                            height: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already you have account",
                            style: des.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ), // Changed text color to black
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: mainBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Please enter a valid email";
                              });
                            } else {
                              CollectionReference collRef = FirebaseFirestore
                                  .instance
                                  .collection('client');
                              await collRef.doc(result.uid).set({
                                'age': ageContraller.text,
                                'email': emailContraller.text,
                                'name': nameConrealler.text,
                                'height': heightContraller.text,
                                'weight': weightContraller.text,
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Registration successful!')),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: mainwhite,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: mainYellow),
                          ),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          CollectionReference collref =
                              FirebaseFirestore.instance.collection('client');
                          collref.add({
                            'age': ageContraller.text,
                            'height': heightContraller.text,
                            'name': nameConrealler.text,
                            'weight': weightContraller.text,
                          });
                        },
                        child: const Text('Add data to database'),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
