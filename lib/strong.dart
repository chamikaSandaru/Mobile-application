import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class strong extends StatefulWidget {
  final String bmi;
  final int age;

  const strong({
    Key? key,
    required this.bmi,
    required this.age,
  }) : super(key: key);

  @override
  State<strong> createState() => _FetchDataFromFirebaseState();
}

class _FetchDataFromFirebaseState extends State<strong> {
  String? imageUrl;
  late DocumentReference fetchData;
  List<String?> imageUrls = List.filled(14, null);

  @override
  void initState() {
    super.initState();
    determineBmiRange();
    fetchImages();
  }

  void determineBmiRange() {
    double bmiValue = double.parse(widget.bmi);
    int age = widget.age;

    if ((bmiValue < 18.5) && (age > 20 && age <= 25)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("20-25")
          .collection("bmi")
          .doc("low bmi");
    } else if ((bmiValue >= 18.5 && bmiValue < 24.9) &&
        (age > 20 && age <= 25)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("20-25")
          .collection("bmi")
          .doc("healthy bmi");
    } else if ((bmiValue >= 30 && bmiValue < 40) && (age > 20 && age <= 25)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("20-25")
          .collection("bmi")
          .doc("high bmi");

      //
    } else if ((bmiValue < 18.5) && (age > 25 && age <= 30)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("25-30")
          .collection("bmi")
          .doc("low bmi");
    } else if ((bmiValue >= 18.5 && bmiValue < 24.9) &&
        (age > 25 && age <= 30)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("25-30")
          .collection("bmi")
          .doc("healthy bmi");
    } else if ((bmiValue >= 30 && bmiValue < 40) && (age > 25 && age <= 30)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("25-30")
          .collection("bmi")
          .doc("high bmi");

      //age wenaswena thena
    } else if ((bmiValue < 18.5) && (age > 30 && age <= 35)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("30-35")
          .collection("bmi")
          .doc("low bmi");
    } else if ((bmiValue >= 18.5 && bmiValue < 24.9) &&
        (age > 30 && age <= 35)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("30-35")
          .collection("bmi")
          .doc("healthy bmi");
    } else if ((bmiValue >= 30 && bmiValue < 40) && (age > 30 && age <= 35)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("30-35")
          .collection("bmi")
          .doc("high bmi");
    }

    //ege wenas wena thena
    else if ((bmiValue < 18.5) && (age > 35 && age <= 40)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("35-40")
          .collection("bmi")
          .doc("low bmi");
    } else if ((bmiValue >= 18.5 && bmiValue < 24.9) &&
        (age > 35 && age <= 40)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("35-40")
          .collection("bmi")
          .doc("healthy bmi");
    } else if ((bmiValue >= 30 && bmiValue < 40) && (age > 35 && age <= 40)) {
      fetchData = FirebaseFirestore.instance
          .collection("Workout")
          .doc("35-40")
          .collection("bmi")
          .doc("high bmi");
    }
  }

  Future<void> fetchImages() async {
    try {
      List<String> paths = [
        'workout/20-25 workout healthy  day 1.gif',
        'workout/20-25 workout healthy  day1.gif',
        'workout/20-25 workout healthy  day2.gif',
        'workout/20-25 workout healthy  day 2.gif',
        'workout/20-25 workout healthy  day3.gif',
        'workout/20-25 workout healthy  day 3.gif',
        'workout/20-25 workout healthy  day 4.png',
        'workout/20-25 workout healthy  day  4.gif',
        'workout/20-25 workout healthy  day 5.gif',
        'workout/20-25 workout healthy  day   5.gif',
        'workout/20-25 workout healthy  day 6.gif',
        'workout/20-25 workout healthy  day6.gif',
        'workout/20-25 workout healthy  day 7.gif',
        'workout/20-25 workout healthy  day  7.gif',
        // Add more paths as needed
      ];

      for (int i = 0; i < paths.length; i++) {
        String url =
            await FirebaseStorage.instance.ref(paths[i]).getDownloadURL();
        setState(() {
          imageUrls[i] = url;
        });
      }

      String url =
          await FirebaseStorage.instance.ref('workout.png').getDownloadURL();

      setState(() {
        imageUrl = url;
      });

      // String ur1 = await FirebaseStorage.instance
      //     .ref('images/25-30 low bmi day 3.jpg')
      //     .getDownloadURL();
      // setState(() {
      //   imageUrl1 = ur1;
      // });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle dayTextStyle = TextStyle(
      fontSize: 20.0, // Set the desired font size
      fontWeight: FontWeight.bold, // Optional: Make the text bold
      color: Colors.blue, // Set the desired text color
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Your workout plan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: fetchData.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching data"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No data available"));
          }

          final documentSnapshot = snapshot.data!;

          String day01 = documentSnapshot.get('day 01') ?? 'No data for Day 01';
          String day02 = documentSnapshot.get('day 02') ?? 'No data for Day 02';
          String day03 = documentSnapshot.get('day 03') ?? 'No data for Day 03';
          String day04 = documentSnapshot.get('day 04') ?? 'No data for Day 04';
          String day05 = documentSnapshot.get('day 05') ?? 'No data for Day 05';
          String day06 = documentSnapshot.get('day 06') ?? 'No data for Day 06';
          String day07 = documentSnapshot.get('day 07') ?? 'No data for Day 07';
          String topic = documentSnapshot.get('topic') ?? 'No data for topic';

          return ListView(
            children: [
              Center(
                child: Text(
                  topic,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0, // Adjust the font size here
                  ),
                  textAlign: TextAlign.center, // Centers the text
                ),
              ),
              const SizedBox(height: 20),
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  height: 200, // Adjust height as needed
                )
              else
                CircularProgressIndicator(),
              const SizedBox(height: 20),
              // Text('Your BMI is: ${widget.bmi}'),
              // Text('Your Age is: ${widget.age}'),
              const SizedBox(height: 20),
              const Text("Day 01", style: dayTextStyle),
              _buildDayContainer(
                day01,
              ),
              _buildImageRow(imageUrls[0], imageUrls[1]),
              const Text("Day 02", style: dayTextStyle),
              _buildDayContainer(day02),
              _buildImageRow(imageUrls[2], imageUrls[3]),
              const Text("Day 03", style: dayTextStyle),
              _buildDayContainer(day03),
              _buildImageRow(imageUrls[4], imageUrls[5]),
              const Text("Day 04"),
              _buildDayContainer(day04),
              _buildImageRow(imageUrls[6], imageUrls[7]),
              const Text("Day 05", style: dayTextStyle),
              _buildDayContainer(day05),
              _buildImageRow(imageUrls[8], imageUrls[9]),
              const Text("Day 06", style: dayTextStyle),
              _buildDayContainer(day06),
              _buildImageRow(imageUrls[10], imageUrls[11]),
              const Text("Day 07", style: dayTextStyle),
              _buildDayContainer(day07),
              _buildImageRow(imageUrls[12], imageUrls[13]),
              // if (imageUrl != null)
              //   Image.network(
              //     imageUrl!,
              //     height: 200,
              //   )
              // else
              //   const CircularProgressIndicator(),
              // if (imageUrl1 != null)
              //   Image.network(
              //     imageUrl1!,
              //     height: 200,
              //   )
              // else
              //   const CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDayContainer(String dayText) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(
            255, 179, 199, 238), // Background color for the container
      ),
      child: Text(
        dayText,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black, // Text color
        ),
      ),
    );
  }

  Widget _buildImageRow(String? imageUrl1, String? imageUrl2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (imageUrl1 != null)
          Image.network(
            imageUrl1,
            height: 150, // Adjust the height as needed
            width: 150, // Adjust the width as needed
          )
        else
          const CircularProgressIndicator(),
        if (imageUrl2 != null)
          Image.network(
            imageUrl2,
            height: 150, // Adjust the height as needed
            width: 150, // Adjust the width as needed
          )
        else
          const CircularProgressIndicator(),
      ],
    );
  }

  Widget _buildImageRo(String? imageUrl1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (imageUrl1 != null)
          Image.network(
            imageUrl1,
            height: 150, // Adjust the height as needed
            width: 150, // Adjust the width as needed
          )
        else
          const CircularProgressIndicator(),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: strong(
        bmi: '22.5',
        age: 22,
      ),
      debugShowCheckedModeBanner: false,
    ));
