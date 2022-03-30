import 'package:flutter/material.dart';
import 'package:project1_quiz_app/question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int _indexQuestion;
  final Function(int score) _showAnswer;

  const Quiz(this.question, this._indexQuestion, this._showAnswer, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Question(question[_indexQuestion]['TextQuestion'].toString()),
          ...(question[_indexQuestion]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
                () => _showAnswer(int.parse(answer['score'].toString())),
                answer['text'].toString());
          }).toList()
        ],
      ),
    );
  }
}
