import 'package:flutter/material.dart'; //adding build/ widget/ material

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp()) /*run the core object*/;

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppstate();
  }
}

class _MyAppstate extends State<MyApp> /*This class is belong to MyApp*/ {
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuenstion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Grey', 'score': 3},
        {'text': 'Green', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Hamster', 'score': 3},
        {'text': 'Dog', 'score': 5},
        {'text': 'Fish', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Major?',
      'answer': [
        {'text': 'CS', 'score': 5},
        {'text': 'EEIT', 'score': 1},
        {'text': 'BA/FA', 'score': 10},
        {'text': 'Arch', 'score': 3},
      ],
    },
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      /*a special widget, does some base setup to return combination -> app*/
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuenstion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, resetQuiz)), /*adding argument*/
    );
  }
}
