import 'package:flutter/material.dart';

import 'main.dart';

class Question extends StatelessWidget {
  final String question;

  const Question(this.question, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        question,
        textAlign: TextAlign.center,
        style:  TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: isSwitch ==false? Colors.black:Colors.white),
      ),

    );
  }
}
