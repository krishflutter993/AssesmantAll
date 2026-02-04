class Question {
  final String category;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer;

  Question({
    required this.category,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() => {
    'category': category,
    'question': question,
    'optionA': optionA,
    'optionB': optionB,
    'optionC': optionC,
    'optionD': optionD,
    'correctAnswer': correctAnswer,
  };
}
