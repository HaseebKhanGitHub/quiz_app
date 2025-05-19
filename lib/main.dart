import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/quiz_screen.dart';
import 'providers/quiz_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        home: QuizScreen(),
      ),
    );
  }
}
