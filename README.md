## 📸 App Screenshots

<p align="center">
  <img src="screenshots/signup.png" width="250" />
  <img src="screenshots/login.png" width="250" />
  <img src="screenshots/dashboard.png" width="250" />

</p>
<p align="center">
   <img src="screenshots/playquiz.png" width="250" />
  <img src="screenshots/readquestions.png" width="250" />
  
</p>

## 📦 Download APK

👉 [Download Signed APK](apk/app-release.apk)


import 'package:databas1/models/Question.dart';
import 'package:databas1/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';




class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});
  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  List<Question> questions = [];
bool loading = true;


  int index = 0;
  int score = 0;
  String? selected;
  Color? answerColor;
  bool answered = false;

  void _nextQuestion() {
    if (selected == questions[index].correct) score += 5;

    if (index < questions.length - 1) {
      // next question
      setState(() {
        index++;
        selected = null;
        answerColor = null;
        answered = false;
      });
    } else {
      // quiz finished
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Completed!'),
          content: Text('Your final score: $score / ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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
    final q = questions[index];
    return Scaffold(
      backgroundColor: const Color(0xFF9CCC65),
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
                  q['q'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Options
                ...List.generate((q['a'] as List).length, (i) {
                  final opt = (q['a'] as List<String>)[i];
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
                        if (value == q['correct']) {
                          answerColor = Colors.green.shade100;
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
 chenj kar kede
