// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_complete_guide/main.dart';

void main() {
  test('Counter increments smoke test', () {
    final qTracker = QuestionTracker();
    expect(qTracker.questionsIndex, 0);
    qTracker.answerQuestion();
    expect(qTracker.questionsIndex, 1);
  });

  testWidgets("My Widget has x property", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Create the Finders.
    final firstQuestionFinder = find.text("What's your favourite color?");
    expect(firstQuestionFinder, findsOneWidget);

    final raisedButtonsFinder = find.byType(RaisedButton);
    expect(raisedButtonsFinder, findsNWidgets(4));
    final answer1ButtonFinder = raisedButtonsFinder.first;
    await tester.tap(answer1ButtonFinder);
    // Rebuild the widget after the state has changed.
    await tester.pump();
    expect(find.text("What's your favourite animal?"), findsOneWidget);

  });
}
