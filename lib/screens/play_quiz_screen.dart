import 'package:databas1/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});
  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  final questions = [
    {
      'q':
          'Which cat species has the longest canine teeth as compared to body size?',
      'a': [
        'Clouded Leopard',
        'African Lion',
        'Siberian Tiger',
        'Indian Tiger',
      ],
      'correct': 'Clouded Leopard',
    },
    {
      'q': 'What is the largest planet in our Solar System?',
      'a': ['Earth', 'Jupiter', 'Saturn', 'Mars'],
      'correct': 'Jupiter',
    },
    {
      'q': 'Who wrote the play "Romeo and Juliet"?',
      'a': [
        'William Shakespeare',
        'Charles Dickens',
        'Jane Austen',
        'Leo Tolstoy',
      ],
      'correct': 'William Shakespeare',
    },
    {
      'q': 'What is the chemical symbol for Gold?',
      'a': ['Ag', 'Au', 'Gd', 'Go'],
      'correct': 'Au',
    },
    {
      'q': 'Which country is known as the Land of the Rising Sun?',
      'a': ['China', 'Japan', 'Thailand', 'South Korea'],
      'correct': 'Japan',
    },
    {
      'q': 'What is the capital of Australia?',
      'a': ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
      'correct': 'Canberra',
    },
    {
      'q': 'Which element has the atomic number 1?',
      'a': ['Oxygen', 'Hydrogen', 'Helium', 'Carbon'],
      'correct': 'Hydrogen',
    },
    {
      'q': 'Who painted the Mona Lisa?',
      'a': [
        'Vincent van Gogh',
        'Leonardo da Vinci',
        'Pablo Picasso',
        'Claude Monet',
      ],
      'correct': 'Leonardo da Vinci',
    },
    {
      'q': 'Which planet is known as the Red Planet?',
      'a': ['Mars', 'Venus', 'Mercury', 'Jupiter'],
      'correct': 'Mars',
    },
    {
      'q': 'Which is the longest river in the world?',
      'a': ['Nile', 'Amazon', 'Yangtze', 'Mississippi'],
      'correct': 'Nile',
    },
    {
      'q': 'Who is known as the Father of Computers?',
      'a': ['Alan Turing', 'Charles Babbage', 'Tim Berners-Lee', 'Steve Jobs'],
      'correct': 'Charles Babbage',
    },
    {
      'q': 'Which gas do plants absorb from the atmosphere?',
      'a': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
      'correct': 'Carbon Dioxide',
    },
    {
      'q': 'What is the hardest natural substance on Earth?',
      'a': ['Gold', 'Iron', 'Diamond', 'Quartz'],
      'correct': 'Diamond',
    },
    {
      'q': 'Which country hosted the 2016 Summer Olympics?',
      'a': ['China', 'Brazil', 'UK', 'Russia'],
      'correct': 'Brazil',
    },
    {
      'q': 'Who discovered penicillin?',
      'a': [
        'Marie Curie',
        'Alexander Fleming',
        'Louis Pasteur',
        'Gregor Mendel',
      ],
      'correct': 'Alexander Fleming',
    },
    {
      'q': 'Which organ purifies blood in the human body?',
      'a': ['Liver', 'Heart', 'Kidney', 'Lungs'],
      'correct': 'Kidney',
    },
    {
      'q': 'Which planet has the most moons?',
      'a': ['Earth', 'Saturn', 'Jupiter', 'Mars'],
      'correct': 'Saturn',
    },
    {
      'q': 'Which country is famous for the Eiffel Tower?',
      'a': ['Italy', 'France', 'Germany', 'Spain'],
      'correct': 'France',
    },
    {
      'q': 'What is the main gas in the Earth’s atmosphere?',
      'a': ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
      'correct': 'Nitrogen',
    },
    {
      'q': 'Who invented the telephone?',
      'a': [
        'Alexander Graham Bell',
        'Thomas Edison',
        'Nikola Tesla',
        'Guglielmo Marconi',
      ],
      'correct': 'Alexander Graham Bell',
    },
    {
      'q': 'Which continent is the Sahara Desert located in?',
      'a': ['Asia', 'Africa', 'Australia', 'South America'],
      'correct': 'Africa',
    },
    {
      'q': 'Which organ is responsible for pumping blood in the human body?',
      'a': ['Lungs', 'Heart', 'Kidneys', 'Brain'],
      'correct': 'Heart',
    },
    {
      'q': 'Who is known as the “Iron Man of India”?',
      'a': [
        'Mahatma Gandhi',
        'Sardar Vallabhbhai Patel',
        'Jawaharlal Nehru',
        'Subhas Chandra Bose',
      ],
      'correct': 'Sardar Vallabhbhai Patel',
    },
    {
      'q': 'Which is the smallest continent by land area?',
      'a': ['Europe', 'Australia', 'Antarctica', 'South America'],
      'correct': 'Australia',
    },
    {
      'q': 'Which vitamin is produced when a person is exposed to sunlight?',
      'a': ['Vitamin A', 'Vitamin B12', 'Vitamin D', 'Vitamin C'],
      'correct': 'Vitamin D',
    },
  ];

  int index = 0;
  int score = 0;
  String? selected;
  Color? answerColor;
  bool answered = false;

  void _nextQuestion() {
    if (selected == questions[index]['correct']) score += 5;

    if (index < questions.length - 1) {
      // next question
      setState(() {
        index++;
        selected = null; // reset selected option
        answerColor = null; // reset background color
        answered = false; // allow next question to be tapped
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
