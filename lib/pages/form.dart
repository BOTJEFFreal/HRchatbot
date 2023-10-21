import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/my_button.dart';

class RatingForm extends StatefulWidget {
  @override
  _RatingFormState createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  List<int> selectedRatings = List.filled(5, 0);

  void selectRating(int questionIndex, int rating) {
    setState(() {
      selectedRatings[questionIndex] = rating;
    });
  }

  bool areAllQuestionsAnswered(List<int> ratings) {
    return !ratings.contains(0);
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      "I rate the freedom that I have to decide how to do my work as:",
      "I'm involved in decisions that affect my work:",
      "I feel that I'm in control when it comes to the work I need to accomplish:",
      "My manager (or someone in management) encourages and supports my development:",
      "How would you rate your overall mood as you begin your workday?"
    ];

    return Scaffold(

      body: SafeArea(
        child: Container(
          color: Colors.white10,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Monday",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),),
                Expanded(
                  child: Container(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < questions.length; i++)
                              Column(
                                children: [
                                  Text(
                                    questions[i],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Low",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      for (int j = 1; j <= 5; j++)
                                        GestureDetector(
                                          onTap: () => selectRating(i, j),
                                          child: Container(
                                            width: 35,
                                            margin: EdgeInsets.all(8),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: selectedRatings[i] == j
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(""),
                                          ),
                                        ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "High",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                MyButton(
                  onTap: () {
                    if (areAllQuestionsAnswered(selectedRatings)) {
                      // All questions are answered, proceed with submission
                      print('Selected Ratings: $selectedRatings');
                    } else {
                      // Show toast
                      Fluttertoast.showToast(
                          msg: "Please answer all questions",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  text: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
