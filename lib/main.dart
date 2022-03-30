import 'package:flutter/material.dart';
import 'package:project1_quiz_app/quiz.dart';
import 'package:project1_quiz_app/result.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isSwitch = false;

class _MyHomePageState extends State<MyHomePage> {
  int _indexQuestion = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  int x = 0;

  _showAnswer(int score) {
    _totalScore += score;
    x = score;
    setState(() {
      _indexQuestion += 1;
    });
  }

  void _resetQuiz2() {
    setState(() {
      if (_indexQuestion != 0 && _totalScore != 0) {
        _indexQuestion -= 1;
        _totalScore -= x;
      } else {
        _indexQuestion = 0;
        _totalScore = 0;
      }
    });
  }

  final List<Map<String, Object>> question = [
    {
      'TextQuestion': 'What\'s your The Capital of palestine ?',
      'answers': [
        {'text': 'Jerusalem', 'score': 10},
        {'text': 'Islamabad', 'score': 0},
        {'text': 'Paris', 'score': 0},
        {'text': 'Beijing', 'score': 0}
      ]
    },
    {
      'TextQuestion': 'How many human teeth ?',
      'answers': [
        {'text': '23', 'score': 0},
        {'text': '36', 'score': 0},
        {'text': '32', 'score': 10},
        {'text': '41', 'score': 0}
      ]
    },
    {
      'TextQuestion': 'What is the largest sea in the world\'s seas ?',
      'answers': [
        {'text': 'Persian Gulf', 'score': 0},
        {'text': 'South China Sea', 'score': 0},
        {'text': 'Strait of Malacca', 'score': 0},
        {'text': 'The Mediterranean Sea', 'score': 10}
      ]
    },
    {
      'TextQuestion': 'What band was Harry Styles in before his solo career ?',
      'answers': [
        {'text': 'One Direction', 'score': 10},
        {'text': 'BTS', 'score': 0},
        {'text': 'Hot Chip', 'score': 0},
        {'text': 'Jonas Brothers', 'score': 0}
      ]
    },
    {
      'TextQuestion':
          'On average how far away is the moon from the earth in miles ?',
      'answers': [
        {'text': '100,590', 'score': 0},
        {'text': '238,000', 'score': 10},
        {'text': '1,001,250', 'score': 0},
        {'text': '300,520', 'score': 0}
      ]
    },
    {
      'TextQuestion': 'Which European city hosted the 1936 Summer Olympics ?',
      'answers': [
        {'text': 'Melbourne', 'score': 0},
        {'text': 'London', 'score': 0},
        {'text': 'Helsinki', 'score': 0},
        {'text': 'Berlin', 'score': 10}
      ]
    },
    {
      'TextQuestion': 'Where is the oldest museum in the world ?',
      'answers': [
        {'text': 'UK ', 'score': 0},
        {'text': 'Egypt', 'score': 0},
        {'text': 'Rome', 'score': 10},
        {'text': 'Italy ', 'score': 0}
      ]
    },
    {
      'TextQuestion': 'Who is the inventor of the light bulb ?',
      'answers': [
        {'text': 'Thomas Edison ', 'score': 10},
        {'text': 'Hiram Maxim', 'score': 0},
        {'text': 'Joseph Swan', 'score': 0},
        {'text': 'Mathew Evans ', 'score': 0}
      ]
    },
    {
      'TextQuestion': 'When did America make the first space flight ?',
      'answers': [
        {'text': '1963 ', 'score': 0},
        {'text': '1975', 'score': 0},
        {'text': '1961', 'score': 10},
        {'text': '1950 ', 'score': 0}
      ]
    },
    {
      'TextQuestion': 'What are the smallest continents in the world area ?',
      'answers': [
        {'text': 'Australia  ', 'score': 10},
        {'text': 'Asia', 'score': 0},
        {'text': 'Europe', 'score': 0},
        {'text': 'Africa ', 'score': 0}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style:  TextStyle(
            color: isSwitch ==false? Colors.white:Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Switch(
            value: isSwitch,
            onChanged: (bool value) {
              setState(() {
                isSwitch = value ;
              });
            },

            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.black38,
            activeColor: Colors.white,
          )
        ],
      ),
      body: Container(
        color: isSwitch ==false? Colors.white:Colors.black,
        child: Column(
          children: [
            _indexQuestion < question.length
                ? Quiz(question, _indexQuestion, _showAnswer)
                : Result(_resetQuiz, _totalScore),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_indexQuestion > 0) {
            _resetQuiz2();
          } else {
            _resetQuiz();
          }
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
