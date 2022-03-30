import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatelessWidget {
  final int text;

  final Function() c;

  const Result(this.c, this.text, {Key? key}) : super(key: key);

  String get _text {
    String _text1;
    if (text >= 90) {
      _text1 = 'You are awesome !';
    } else if (text >= 50) {
      _text1 = ' pretty likable !';
    } else {
      _text1 = 'you are bad!';
    }
    return _text1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Done !\n you\'r Score is $text/100 \n $_text',
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: isSwitch ==false? Colors.black:Colors.white,

            ),
          ),
          const SizedBox(height: 100),
          TextButton(
            onPressed: c,
            child:  Text(
              'Restart',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: isSwitch ==false? Colors.white:Colors.black),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFFF5252)),
              padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 20, 30, 20))
            ),
          )
        ],
      ),
    );
  }
}
