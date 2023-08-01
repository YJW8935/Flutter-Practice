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

    if (totalScore <= 10) {
      resultMessage = '무해하고 귀여운 토끼';
    } else if (totalScore <= 14) {
      resultMessage = '해맑은 강아지';
    } else if (totalScore <= 18) {
      resultMessage = '도도한 고양이';
    } else {
      resultMessage = '맹렬한 호랑이';
    }

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Text(resultMessage),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: () => resetQuiz(), child: Text("Reset Quiz"))
        ],
      ),
    );
  }
}
