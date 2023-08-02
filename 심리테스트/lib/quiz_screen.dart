import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/question_list.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.answerPressed,
    required this.questionIndex,
  }) : super(key: key);

  final Function answerPressed;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 120),
          Text(
            questionList[questionIndex]["questionText"],
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () => answerPressed(
                  questionList[questionIndex]["answers"][0]["score"]),
              child: Text(questionList[questionIndex]["answers"][0]["text"]),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () => answerPressed(
                  questionList[questionIndex]["answers"][1]["score"]),
              child: Text(questionList[questionIndex]["answers"][1]["text"]),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () => answerPressed(
                  questionList[questionIndex]["answers"][2]["score"]),
              child: Text(questionList[questionIndex]["answers"][2]["text"]),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () => answerPressed(
                  questionList[questionIndex]["answers"][3]["score"]),
              child: Text(questionList[questionIndex]["answers"][3]["text"]),
            ),
          ),
        ],
      ),
    );
  }
}
