import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _registerUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Register user
        final result =
            await _auth.registerWithEmailAndPassword(email, password);

        if (result == null) {
          setState(() {
            error =
                "Registration failed. Please check your email and password.";
          });
        } else {
          // Get the user UID from UserCredential
          final userId = result.user!.uid;

          // Convert height and weight to double
          final height = double.tryParse(heightController.text);
          final weight = double.tryParse(weightController.text);

          // Save user details to Firestore
          await firestore.collection('client').doc(userId).set({
            'name': nameController.text,
            'email': emailController.text,
            'age': int.tryParse(ageController.text),
            'height': height,
            'weight': weight,
          });

          // Optionally, navigate to another page
          Navigator.of(context)
              .pushReplacementNamed('/home'); // Adjust as necessary
        }
      } catch (e) {
        setState(() {
          error = "An error occurred: ${e.toString()}";
        });
        print("Error: ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 145, 217, 250),
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(color: Colors.black),
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
                "If you don't have an account, you can register here",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 22, 73),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
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
                      TextFormField(
                        controller: nameController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter Name" : null,
                      ),
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Email",
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
                        controller: passwordController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (val) => val!.length < 6
                            ? "Enter a password with at least 6 characters"
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      TextFormField(
                        controller: ageController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Age",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter Age" : null,
                      ),
                      TextFormField(
                        controller: heightController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Height (cm)",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter Height" : null,
                      ),
                      TextFormField(
                        controller: weightController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Weight (kg)",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter Weight" : null,
                      ),
                      SizedBox(height: 50),
                      Text(error, style: TextStyle(color: Colors.red)),
                      Text(
                        "Login with social account",
                        style: TextStyle(
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
                            "Already have an account?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: _registerUser,
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.yellow),
                          ),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ),
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
