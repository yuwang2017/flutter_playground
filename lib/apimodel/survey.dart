import 'question.dart';

class Survey {
  final String userId;
  final String surveyLot;
  final DateTime startDate;
  final DateTime submitDate;
  final DateTime lastAccessDate;
  final String status;
  List<SurveyQuestion> questions;

  Survey({
    required this.userId,
    required this.surveyLot,
    required this.startDate,
    required this.submitDate,
    required this.lastAccessDate,
    required this.status,
    required this.questions,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    final reviewsData = json['questions'] as List<dynamic>?;
    return Survey(
      userId: json['userId'],
      surveyLot: json['surveyLot'],
      startDate: DateTime.parse(json['startDate']),
      submitDate: json['submitDate'] == null
          ? DateTime.now()
          : DateTime.parse(json['submitDate']),
      lastAccessDate: DateTime.parse(json['lastAccessDate']),
      status: json['status'],
      questions: reviewsData != null
          ? reviewsData
              // map each review to a Review object
              .map((reviewData) =>
                  SurveyQuestion.fromJson(reviewData as Map<String, dynamic>))
              .toList() // map() returns an Iterable so we convert it to a List
          : <SurveyQuestion>[],
    );
  }

  Map toJson() {
    List<Map> tags = questions.map((i) => i.toJson()).toList();
    return {
      'userId': userId,
      'surveyLot': surveyLot,
      'startDate': startDate.toString(),
      'submitDate': submitDate.toString(),
      'lastAccessDate': lastAccessDate.toString(),
      'status': status,
      'questions': tags,
    };
  }
}
