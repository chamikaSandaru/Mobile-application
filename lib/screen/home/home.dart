import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project/fetchdataFrom.dart';
import 'package:project/services/auth.dart';
import 'package:project/strong.dart';
import 'package:project/target.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices(); // Initialize AuthServices instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String bmi = ""; // Store the BMI as a class-level variable
  int age = 20;

  Home(
      {super.key}); // Default age value, can be replaced later with actual data

  Future<String> getCurrentUserUID() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user.uid; // Return UID of the authenticated user
      } else {
        print('No user is authenticated.');
        return 'No UID found'; // No user is authenticated
      }
    } catch (e) {
      print("Error getting current user UID: $e");
      return 'Error';
    }
  }

  Future<Map<String, dynamic>> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('client').doc(uid).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>? ?? {};
      } else {
        print("No document found for UID: $uid");
        return {};
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return {};
    }
  }

  Future<void> showUserInfoDialog(BuildContext context) async {
    String uid = await getCurrentUserUID();
    if (uid != 'No UID found' && uid != 'Error') {
      Map<String, dynamic> userData = await getUserData(uid);

      double? height = userData['height']?.toDouble();
      double? weight = userData['weight']?.toDouble();
      age =
          userData['age'] ?? 20; // Fetch age from userData or use default value
      bmi = 'Not available'; // Initialize with a default value

      if (height != null && weight != null && height > 0) {
        double heightInMeters = height / 100; // Convert height to meters
        double bmiValue =
            weight / (heightInMeters * heightInMeters); // Calculate BMI
        bmi = bmiValue.toStringAsFixed(2); // Format BMI to 2 decimal places
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('User Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('UID: $uid'),
              SizedBox(height: 8),
              Text('Name: ${userData['name'] ?? 'Not available'}'),
              Text('Age: $age'), // Display user's age
              Text('Height: ${userData['height'] ?? 'Not available'}'),
              Text('Weight: ${userData['weight'] ?? 'Not available'}'),
              SizedBox(height: 8),
              Text('BMI: $bmi'),
            ],
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Unable to retrieve user information.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text('VITALYHUB'),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () async {
                await showUserInfoDialog(context);
              },
            ),
            IconButton(
              onPressed: () async {
                await signOut(); // Call signout method here
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 200,
                  width: 300,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      _buildGridItem(
                        title: 'DIAT',
                        subtitle: 'Foods',
                        icon: Icons.food_bank_outlined,
                        onTap: () async {
                          String uid = await getCurrentUserUID();
                          Map<String, dynamic> userData =
                              await getUserData(uid);
                          int userAge = userData['age'] ?? 20;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FetchDataFromFirebase(
                                bmi: bmi, // Pass the BMI
                                age: userAge, // Pass the age
                              ),
                            ),
                          );
                        },
                      ),
                      _buildGridItem(
                        title: 'STRONG',
                        subtitle: 'Workout Routines',
                        icon: Icons.fitness_center,
                        onTap: () async {
                          String uid = await getCurrentUserUID();
                          Map<String, dynamic> userData =
                              await getUserData(uid);
                          int userAge = userData['age'] ?? 20;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => strong(
                                bmi: bmi,
                                age: userAge,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home, color: Colors.white),
                ),
                SizedBox(width: 30),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white),
                ),
                SizedBox(width: 30),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.white),
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        color: Color.fromARGB(255, 206, 220, 241),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 16),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
