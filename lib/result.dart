import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    //This is a mixture, which cannot receive any argument
    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = 'You are awsome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strage?!';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text('Restart Quiz!'),
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, backgroundColor: Colors.white),
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}
