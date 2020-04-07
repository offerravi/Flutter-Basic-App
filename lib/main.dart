//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercompleteguide/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color? ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 4},
        {'text': 'White', 'score': 5},
        {'text': 'Red', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favorite Animal? ',
      'answers': [
        {'text': 'Black Mamba', 'score': 12},
        {'text': 'Blue Whale', 'score': 7},
        {'text': 'White Rabbit', 'score': 5},
        {'text': 'Red Bug', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Character? ',
      'answers': [
        {'text': 'Maximus', 'score': 6},
        {'text': 'Decelieu', 'score': 8},
        {'text': 'Mario', 'score': 2},
        {'text': 'Luigi', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {

    //_totalScore = _totalScore + score;
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more Questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!!!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
