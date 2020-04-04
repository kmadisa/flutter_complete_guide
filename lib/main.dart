import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   var app = MyApp();
//   runApp(app);
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionText': "What's your favourite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Green', 'score': 1},
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': "Who is your favourite instructor?",
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Tommy', 'score': 1},
        {'text': 'Bhokwe', 'score': 1},
        {'text': 'Pumkin', 'score': 1},
      ]
    },
  ];
  int _questionsIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    if (_questionsIndex < _questions.length) {
      setState(() {
        _questionsIndex += 1;
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body:_questionsIndex < _questions.length
          ?  Quiz(_answerQuestion, _questions, _questionsIndex)
          :  Result(_totalScore, _resetQuiz),
      ),
    );
  }

}

class QuestionTracker {

  int questionsIndex = 0;

  void answerQuestion() {
    questionsIndex += 1;
  }

}