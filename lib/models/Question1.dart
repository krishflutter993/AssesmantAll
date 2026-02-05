class Question {
  int? id;
  String question;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correct;

  Question({
    this.id,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correct,
  });

  // DB me insert karne ke liye
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correct': correct,
    };
  }

  // DB se read karne ke liye
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      optionA: map['optionA'],
      optionB: map['optionB'],
      optionC: map['optionC'],
      optionD: map['optionD'],
      correct: map['correct'],
    );
  }
}
