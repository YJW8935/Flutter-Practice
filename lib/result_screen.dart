import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.totalScore, required this.resetQuiz})
      : super(key: key);

  final int totalScore;
  final Function resetQuiz;

  @override
  Widget build(BuildContext context) {
    String resultMessage;
    String pic;
    

    if (totalScore <= 10) {
      resultMessage = '무해하고 귀여운 토끼';
      pic = 'assets/images/rabbit.jpg';
    } else if (totalScore <= 14) {
      resultMessage = '해맑은 강아지';
      pic = 'assets/images/dog.jpg';
    } else if (totalScore <= 18) {
      resultMessage = '도도한 고양이';
      pic = 'assets/images/cat.png';
    } else {
      resultMessage = '맹렬한 호랑이';
      pic = 'assets/images/tiger.jpg';
    }

    return Center(
      child: Column(
        children: [
          SizedBox(height: 150),
          Image.asset(pic),
          SizedBox(height: 50),
          Text(
            resultMessage,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 100),
          SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () => resetQuiz(),
                  child: Text("Reset Quiz")))
        ],
      ),
    );
  }
}
