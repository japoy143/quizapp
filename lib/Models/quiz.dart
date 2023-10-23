import 'package:hive/hive.dart';

part 'quiz.g.dart';

@HiveType(typeId: 0)
class Quiz {
  @HiveField(0, defaultValue: 0)
  int? id;
  @HiveField(1)
  String memeImageUrl;
  @HiveField(2)
  String question;
  @HiveField(3)
  String answer;
  @HiveField(4)
  String choice1;
  @HiveField(5)
  String choice2;
  @HiveField(6)
  String choice3;

  Quiz(
      {required this.memeImageUrl,
      required this.question,
      required this.answer,
      required this.choice1,
      required this.choice2,
      required this.choice3});
}
