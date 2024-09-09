import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DefaultScreen extends StatefulWidget {
  final String bmi;
  final int age;

  const DefaultScreen({Key? key, required this.bmi, required this.age})
      : super(key: key);

  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  String? imageUrl;
  String? image1;
  String? image2;
  String bmiCategory = "";

  @override
  void initState() {
    super.initState();
    fetchImage();
    determineBMICategory();
  }

  Future<void> fetchImage() async {
    try {
      String url = await FirebaseStorage.instance
          .ref('931bac76a935675ad0aaa04936420d45.png')
          .getDownloadURL();

      setState(() {
        image1 = url;
      });
      String url1 = await FirebaseStorage.instance
          .ref('images/25-30 low bmi 1.png')
          .getDownloadURL();

      setState(() {
        imageUrl = url1;
      });
      String url2 = await FirebaseStorage.instance
          .ref('images/25-30 low bmi  day6.jpg')
          .getDownloadURL();

      setState(() {
        image2 = url2;
      });
    } catch (e) {
      print(e);
    }
  }

  void determineBMICategory() {
    try {
      double bmiValue = double.parse(widget.bmi);
      if (bmiValue < 18.5) {
        bmiCategory = "Underweight";
      } else if (bmiValue >= 18.5 && bmiValue < 24.9) {
        bmiCategory = "Normal weight";
      } else if (bmiValue >= 25 && bmiValue < 29.9) {
        bmiCategory = "Overweight";
      } else if (bmiValue >= 30) {
        bmiCategory = "Obese";
      }
    } catch (e) {
      bmiCategory = "Invalid BMI";
      print("Error parsing BMI: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Screen'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  height: 200, // Adjust height as needed
                )
              else
                CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'Welcome to the Default Screen!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Your BMI is: ${widget.bmi}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'BMI Category: $bmiCategory',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Your Age is: ${widget.age}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 20),
              if (image1 != null)
                Image.network(
                  image1!,
                  height: 200, // Adjust height as needed
                )
              else
                CircularProgressIndicator(),
              SizedBox(height: 20),
              if (image2 != null)
                Image.network(
                  image2!,
                  height: 200, // Adjust height as needed
                )
              else
                CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: DefaultScreen(
      bmi: '22.5',
      age: 20,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
