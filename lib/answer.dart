import 'package:flutter/material.dart';

import 'main.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function() x;

  const Answer(this.x, this.answer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: ElevatedButton(
          onPressed: x,
          child: Text(
            answer,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: isSwitch ==false? Colors.white:Colors.black,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFFFF5252),
            ),
            shadowColor: MaterialStateProperty.all(const Color(0xFFFF5252)),
            elevation: MaterialStateProperty.all(10),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          )
      ),
    );
  }
}
