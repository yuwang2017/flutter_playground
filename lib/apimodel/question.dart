class SurveyQuestion {
  final int index;
  final String audioFileName;
  String answer;

  SurveyQuestion({
    required this.index,
    required this.audioFileName,
    required this.answer,
  });

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) {
    return SurveyQuestion(
      index: json['index'],
      audioFileName: json['audioFileName'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() => {
        'index': index,
        'audioFileName': audioFileName,
        'answer': answer,
      };
}
