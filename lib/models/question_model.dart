import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String id;
  String title;
  String? image;
  String description;
  int timeSeconds;
  int questionCount;

  List<Questions>? questions;

  QuestionModel(
      {required this.id,
      required this.title,
      this.image,
      required this.timeSeconds,
      required this.description,
      required this.questionCount,
      this.questions});

  QuestionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        image = json['image'] as String,
        timeSeconds = json['time_seconds'] as int,
        description = json['description'] as String,
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  QuestionModel.fromSnapshot(DocumentSnapshot json)
      : id = json.id,
        title =
            json.data().toString().contains('title') ? json.get('title') : '',
        image = json.data().toString().contains('') ? json.get('image') : '',
        timeSeconds = json['time_seconds'] as int,
        description = json.data().toString().contains('description')
            ? json.get('description')
            : '',
        questionCount = json['questions_count'] as int,
        questions = [];

  String timeInMinits() => "${(timeSeconds / 60).ceil()} мин";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['time_seconds'] = timeSeconds;
    data['description'] = description;

    // data['questions'] = questions!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;
  String? selectedAnswer;

  Questions({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['answer'];

  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : identifier = snapshot['identifier'] as String,
        answer = snapshot['answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['answer'] = answer;
    return data;
  }
}
