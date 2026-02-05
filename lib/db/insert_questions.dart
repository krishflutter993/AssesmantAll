import 'package:databas1/data/questions.dart';
import 'package:databas1/db/database_helper.dart';
import 'package:databas1/models/read_question.dart';

Future<void> insertQuestionsIfEmpty() async {
  final db = DatabaseHelper();
  final count = await db.questionCount();

  if (count == 0) {
    for (var q in questions) {
      final List options = q['a'] as List;
      final List<String> optionStrings = options
          .map((e) => e.toString())
          .toList();

      await db.insertQuestion({
        'question': q['q'].toString(),
        'optionA': optionStrings[0],
        'optionB': optionStrings[1],
        'optionC': optionStrings[2],
        'optionD': optionStrings[3],
        'correct': q['correct'].toString(),
      });
    }

    final read = await db.getAllReadQuestions();
    if (read.isEmpty) {
      for (var cat in categoryQuestions.entries) {
        for (var qa in cat.value.entries) {
          await db.insertReadQuestion(
            ReadQuestion(
              category: cat.key,
              question: qa.key,
              answer: qa.value,
            ).toMap(),
          );
        }
      }
    }
  }
}
