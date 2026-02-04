import 'package:flutter/material.dart';

class ReadQuestionsScreen extends StatelessWidget {
  const ReadQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Categories mapped to their questions and answers
    final Map<String, Map<String, String>> categoryQuestions = {
      'Fundamentals': {
        'What is Flutter?':
            'Flutter is an open-source UI toolkit by Google for building natively compiled apps for mobile, web, and desktop from a single codebase using Dart.',
        'Explain OOP concepts.':
            'OOP (Object-Oriented Programming) includes Encapsulation, Abstraction, Inheritance, and Polymorphism.',
        'What is a widget in Flutter?':
            'A widget is an immutable description of part of a UI in Flutter.',
        'Difference between StatelessWidget and StatefulWidget?':
            'StatelessWidget cannot change state; StatefulWidget can rebuild when its state changes.',
        'Explain the Flutter build() method.':
            'The build() method describes the part of the UI represented by a widget and is called to render or rebuild it.',
        'What is hot reload and hot restart?':
            'Hot reload updates the running app with code changes without losing state; hot restart restarts the app and resets state.',
        'What are streams in Dart?':
            'A stream is a sequence of asynchronous events, allowing you to listen and react to data over time.',
        'Difference between async, await, and Future in Dart?':
            'Future represents a value that will be available later; async marks a function asynchronous; await pauses execution until the Future completes.',
      },
      'SQL': {
        'What is a JOIN?':
            'A JOIN combines rows from two or more tables based on a related column.',
        'Explain primary key and foreign key.':
            'Primary key uniquely identifies a record; foreign key links to a primary key in another table.',
        'What is the difference between INNER JOIN and OUTER JOIN?':
            'INNER JOIN returns matching rows only; OUTER JOIN returns matching rows plus non-matching rows from one or both tables.',
        'What is a UNIQUE constraint?':
            'A UNIQUE constraint ensures all values in a column are distinct.',
        'Explain normalization and denormalization.':
            'Normalization reduces redundancy and dependency; denormalization adds redundancy for performance.',
        'What is an index and why is it used?':
            'An index improves query performance by allowing faster data retrieval.',
        'Difference between DELETE and TRUNCATE.':
            'DELETE removes rows one by one and can be rolled back; TRUNCATE removes all rows quickly and cannot be rolled back.',
        'Explain GROUP BY and HAVING clauses.':
            'GROUP BY groups rows with the same values; HAVING filters groups based on conditions.',
      },
      'HR Questions': {
        'Tell me about yourself.':
            'Give a brief summary of your professional background, skills, and achievements relevant to the job.',
        'What are your strengths?':
            'Highlight skills or qualities that make you a strong candidate for the role.',
        'What are your weaknesses?':
            'Be honest but show how you are working to improve them.',
        'Where do you see yourself in 5 years?':
            'Share career goals that align with growth in the role or company.',
        'Why do you want to work with us?':
            'Explain your interest in the company’s culture, projects, or values.',
        'Describe a challenging situation you faced and how you handled it.':
            'Give a specific example, explain the problem, your actions, and the result.',
        'How do you handle stress or pressure?':
            'Explain techniques you use to stay organized, calm, and productive.',
        'Do you prefer working in a team or alone? Why?':
            'Answer honestly, explaining how your preference suits your work style or role.',
      },
    };

    final categories = categoryQuestions.keys.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Read Questions')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, i) {
          final category = categories[i];
          return ListTile(
            title: Text(category),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuestionsScreen(
                    category: category,
                    questions: categoryQuestions[category]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Screen to display questions and show answers on tap
class QuestionsScreen extends StatelessWidget {
  final String category;
  final Map<String, String> questions;

  const QuestionsScreen({
    super.key,
    required this.category,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    final questionList = questions.keys.toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (_, i) {
          final question = questionList[i];
          return ListTile(
            title: Text(question),
            trailing: const Icon(Icons.info_outline),
            onTap: () {
              // Show answer in a dialog
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Answer'),
                  content: Text(questions[question]!),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
