class ReadQuestion {
  int? id;
  String category;
  String question;
  String answer;

  ReadQuestion({
    this.id,
    required this.category,
    required this.question,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'question': question,
      'answer': answer,
    };
  }

  factory ReadQuestion.fromMap(Map<String, dynamic> map) {
    return ReadQuestion(
      id: map['id'],
      category: map['category'],
      question: map['question'],
      answer: map['answer'],
    );
  }
}
