import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/read_question.dart';

class ReadQuestionsScreen extends StatelessWidget {
  const ReadQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Read Questions')),
      body: FutureBuilder<List<ReadQuestion>>(
        future: DatabaseHelper().getAllReadQuestions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          final Map<String, List<ReadQuestion>> grouped = {};

          for (var q in data) {
            grouped.putIfAbsent(q.category, () => []);
            grouped[q.category]!.add(q);
          }

          final categories = grouped.keys.toList();

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (_, i) {
              final cat = categories[i];
              return ListTile(
                title: Text(cat),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuestionsScreen(
                        category: cat,
                        questions: grouped[cat]!,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class QuestionsScreen extends StatelessWidget {
  final String category;
  final List<ReadQuestion> questions;

  const QuestionsScreen({
    super.key,
    required this.category,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (_, i) {
          final q = questions[i];
          return ListTile(
            title: Text(q.question),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Answer'),
                  content: Text(q.answer),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
