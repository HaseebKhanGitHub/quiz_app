import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _score = 0;
  List<int?> _selectedAnswers = List.filled(5, null);

  final List<Question> _questions = [
    Question(
      question: "What is the capital of France?",
      options: ["Berlin", "Madrid", "Paris", "Rome"],
      correctIndex: 2,
    ),
    Question(
      question: "What is Flutter?",
      options: ["SDK", "OS", "Database", "Language"],
      correctIndex: 0,
    ),
    Question(
      question: "Which planet is known as the Red Planet?",
      options: ["Earth", "Mars", "Jupiter", "Saturn"],
      correctIndex: 1,
    ),
    Question(
      question: "2 + 2 = ?",
      options: ["3", "4", "5", "6"],
      correctIndex: 1,
    ),
    Question(
      question: "Who developed Dart?",
      options: ["Google", "Apple", "Microsoft", "Amazon"],
      correctIndex: 0,
    ),
  ];

  int get currentIndex => _currentIndex;

  int get score => _score;

  List<Question> get questions => _questions;

  List<int?> get selectedAnswers => _selectedAnswers;

  void selectAnswer(int answerIndex) {
    _selectedAnswers[_currentIndex] = answerIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_selectedAnswers[_currentIndex] ==
        _questions[_currentIndex].correctIndex) {
      _score++;
    }
    _currentIndex++;
    notifyListeners();
  }

  void resetQuiz() {
    _score = 0;
    _currentIndex = 0;
    _selectedAnswers = List.filled(5, null);
    notifyListeners();
  }

  void submitQuiz() {
    // Only evaluate current answer once on Submit
    if (_selectedAnswers[_currentIndex] ==
        _questions[_currentIndex].correctIndex) {
      _score++;
    }
    notifyListeners(); // don't increment index here
  }
}
