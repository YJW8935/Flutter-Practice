import 'package:flutter/material.dart';
import 'package:flutter_practice/question_list.dart';
import 'package:flutter_practice/quiz_screen.dart';
import 'package:flutter_practice/result_screen.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;
  int totalScore = 0;

  void answerPressed(int score) {
    setState(() {
      questionIndex++;
    });
    totalScore += score;
    print(totalScore);
  }
  
  void resetQuiz() {
    setState(() {
      questionIndex = 0;
    });
    totalScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내 성격과 닮은 동물은?"),
        backgroundColor: Colors.green,
      ),
      body: (questionIndex < questionList.length)
          ? Quiz(answerPressed: answerPressed, questionIndex: questionIndex)
          : Result(totalScore: totalScore, resetQuiz: resetQuiz,),
    );
  }
}
