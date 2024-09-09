import 'package:flutter/material.dart';
// import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: diate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class diate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("diat")),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: Image.asset(
                  //     "assets/weekboy.png",
                  //     height: 300,
                  //   ),
                  // ),
                  SizedBox(width: 20),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Image.asset(
                  //     "assets/v__1_-removebg-preview.png",
                  //     height: 100,
                  //     width: 200,
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "You are too weak lets get Strong !",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Flow this diet -",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: AutofillHints.birthday,
                              color: Color.fromARGB(255, 5, 43, 231),
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text(
                      "Day 01",
                      style: TextStyle(color: Colors.blue, fontSize: 40),
                    )
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "• Breakfast: Oatmeal with milk, topped with bananas and nuts \n"
                                "• Mid-Morning Snack: A smoothie with yogurt, berries, and honey \n"
                                "• Lunch: Grilled chicken sandwich with avocado, lettuce, and tomato \n"
                                "• Afternoon Snack: Apple slices with peanut butter \n"
                                "• Dinner: Baked salmon, quinoa, and steamed broccoli \n"
                                "• Evening Snack: Greek yogurt with a handful of almonds",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.left),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 170, 213, 235),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      )),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/img1.png",
                            height: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/img2.png",
                            height: 100,
                            width: 90,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(children: [
                Text(
                  "Day 02",
                  style: TextStyle(color: Colors.blue, fontSize: 40),
                )
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/img2.png",
                        height: 100,
                        width: 90,
                      )
                    ],
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "• Breakfast: Scrambled eggs with spinach and whole-grain toast \n"
                            "• Mid-Morning Snack: A banana and a handful of mixed nuts \n"
                            "• Lunch: Turkey wrap with hummus, cucumber, and bell peppers \n"
                            "• Afternoon Snack: Carrot sticks with guacamole \n"
                            "• Dinner: Beef stir-fry with vegetables and brown rice \n"
                            "• Evening Snack: Cottage cheese with pineapple chunks",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 170, 213, 235),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Day 03",
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "• Breakfast: Scrambled eggs with spinach and whole-grain toast \n"
                            "• Mid-Morning Snack: A banana and a handful of mixed nuts \n"
                            "• Lunch: Turkey wrap with hummus, cucumber, and bell peppers \n"
                            "• Afternoon Snack: Carrot sticks with guacamole \n"
                            "• Dinner: Beef stir-fry with vegetables and brown rice \n"
                            "• Evening Snack: Cottage cheese with pineapple chunks",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 170, 213, 235),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  )),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/img2.png",
                        height: 100,
                        width: 90,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Day 04",
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/img2.png",
                        height: 100,
                        width: 90,
                      )
                    ],
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "• Breakfast: Scrambled eggs with spinach and whole-grain toast \n"
                            "• Mid-Morning Snack: A banana and a handful of mixed nuts \n"
                            "• Lunch: Turkey wrap with hummus, cucumber, and bell peppers \n"
                            "• Afternoon Snack: Carrot sticks with guacamole \n"
                            "• Dinner: Beef stir-fry with vegetables and brown rice \n"
                            "• Evening Snack: Cottage cheese with pineapple chunks",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 170, 213, 235),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Day 05",
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "• Breakfast: Scrambled eggs with spinach and whole-grain toast \n"
                            "• Mid-Morning Snack: A banana and a handful of mixed nuts \n"
                            "• Lunch: Turkey wrap with hummus, cucumber, and bell peppers \n"
                            "• Afternoon Snack: Carrot sticks with guacamole \n"
                            "• Dinner: Beef stir-fry with vegetables and brown rice \n"
                            "• Evening Snack: Cottage cheese with pineapple chunks",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 170, 213, 235),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  )),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/img2.png",
                        height: 100,
                        width: 90,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Day 06",
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/img2.png",
                        height: 100,
                        width: 90,
                      )
                    ],
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "• Breakfast: Scrambled eggs with spinach and whole-grain toast \n"
                            "• Mid-Morning Snack: A banana and a handful of mixed nuts \n"
                            "• Lunch: Turkey wrap with hummus, cucumber, and bell peppers \n"
                            "• Afternoon Snack: Carrot sticks with guacamole \n"
                            "• Dinner: Beef stir-fry with vegetables and brown rice \n"
                            "• Evening Snack: Cottage cheese with pineapple chunks",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 170, 213, 235),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Day 07",
                    style: TextStyle(color: Colors.blue, fontSize: 40),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "• Breakfast: Scrambled eggs with spinach and whole-grain toast \n"
                            "• Mid-Morning Snack: A banana and a handful of mixed nuts \n"
                            "• Lunch: Turkey wrap with hummus, cucumber, and bell peppers \n"
                            "• Afternoon Snack: Carrot sticks with guacamole \n"
                            "• Dinner: Beef stir-fry with vegetables and brown rice \n"
                            "• Evening Snack: Cottage cheese with pineapple chunks",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.left,
                          )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 170, 213, 235),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  )),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/img2.png",
                        height: 100,
                        width: 90,
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Container(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Page1()));
                //   },
                //   icon: Icon(Icons.home, color: Colors.white),
                // ),
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
