import 'package:flutter/material.dart';
import 'package:project/admin.dart';
// import 'package:project/admin/admin.dart';
import 'package:project/constants/color.dart';
import 'package:project/constants/style.dart';
import 'package:project/services/auth.dart';
// Import the admin page

class Sign_In extends StatefulWidget {
  final Function toggle;
  const Sign_In({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    "Sign In",
                    style: topic.copyWith(color: Colors.black),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  "Login Your account",
                  style: des.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
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
                        TextFormField(
                          style: TextStyle(color: Colors.black),
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
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
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
                        SizedBox(height: 50),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          "Login with social account",
                          style: des.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w300),
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
                              "Do not have account",
                              style: des.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                widget.toggle();
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: mainBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              if (email == 'admin@gmail.com' &&
                                  password == 'admin1234') {
                                // Navigate to the admin page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminPage(),
                                  ),
                                );
                              } else {
                                dynamic result =
                                    await _auth.signInUsingEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        "Invalid credentials or not authorized";
                                  });
                                } else {
                                  // Handle normal user login, navigate to another page if needed
                                }
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
                            child: Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            await _auth.signInAnonymously();
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              color: mainwhite,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 2, color: mainYellow),
                            ),
                            child: Center(
                              child: Text(
                                "Log In as Guest",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
