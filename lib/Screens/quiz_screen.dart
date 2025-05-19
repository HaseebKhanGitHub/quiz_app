import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/result_screen.dart';
import '../providers/quiz_provider.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context);

    if (quiz.currentIndex >= quiz.questions.length) {
      // Navigate to result screen
      Future.microtask(
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ResultScreen()),
        ),
      );
      return SizedBox(); // Or a loading indicator
    }
    final currentQ = quiz.questions[quiz.currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Quiz App",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.orange.shade100),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Question ${quiz.currentIndex + 1} of ${quiz.questions.length}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Consumer<QuizProvider>(
              builder: (context, quiz, child) {
                final currentQ = quiz.questions[quiz.currentIndex];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          currentQ.question,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        for (int i = 0; i < 4; i++)
                          RadioListTile<int>(
                            title: Text(currentQ.options[i]),
                            value: i,
                            groupValue:
                                quiz.selectedAnswers[quiz.currentIndex],
                            onChanged: (val) {
                              quiz.selectAnswer(val!);
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (quiz.currentIndex < 4) {
                  quiz.nextQuestion();
                } else {
                  quiz.nextQuestion();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ResultScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                quiz.currentIndex == 4 ? "Submit" : "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
