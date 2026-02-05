import 'package:databas1/data/questions.dart';
import 'package:databas1/db/database_helper.dart';
import 'package:databas1/models/Question1.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  List<Question> quizQuestions = [];
  bool isLoading = true;

  int index = 0;
  int score = 0;
  String? selected;
  Color? answerColor;
  bool answered = false;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    final db = DatabaseHelper();
    quizQuestions = (await db.getAllQuestions()).cast<Question>();
    setState(() => isLoading = false);
  }

  void _nextQuestion() {
    if (selected == quizQuestions[index].correct) {
      score += 5;
    }

    if (index < quizQuestions.length - 1) {
      setState(() {
        index++;
        selected = null;
        answered = false;
        answerColor = null;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Score: $score / ${quizQuestions.length * 5}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final q = quizQuestions[index];
    final options = [q.optionA, q.optionB, q.optionC, q.optionD];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 139, 61),
      appBar: AppBar(title: const Text('Play Quiz')),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: answerColor ?? Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dynamic top bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1} / ${questions.length} Questions",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$score / ${questions.length * 5} Marks",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Question text
                Text(
                  q.question,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Options
                ...options.map((opt) {
                  return RadioListTile<String>(
                    title: Text(opt),
                    value: opt,
                    groupValue: selected,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      if (answered)
                        return; // Agar pehle se answer diya gaya hai, ignore karo
                      setState(() {
                        selected = value;
                        answered = true;

                        // Agar answer sahi hai
                        if (selected == quizQuestions[index].correct) {
                          answerColor = Colors.green.shade100;
                          score += 5;
                        } else {
                          answerColor = Colors.red.shade100;
                        }
                      });
                    },
                  );
                }),

                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: selected == null
                        ? null
                        : _nextQuestion, // disable if no selection
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(180, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      index == questions.length - 1 ? "Finish Quiz" : "Next ➜",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
