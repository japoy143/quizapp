import 'dart:io';

import 'package:app3/Models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //db
  late Box<Quiz> quizBox;

  void updateValueNotifier() {
    valueNotifier.value = quizBox.values.toList();
  }

  //listener notifier
  late ValueNotifier<List<Quiz>> valueNotifier;

  //quiz page index
  int quizIndex = 0;

  @override
  void initState() {
    quizBox = Hive.box('quizBox');
    valueNotifier = ValueNotifier(quizBox.values.toList());
    updateValueNotifier();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, List<Quiz> quizes, child) {
            return ListView.builder(
                itemCount: quizBox.isEmpty ? quizBox.length : 1,
                itemBuilder: (context, index) {
                  final memeQuiz = quizes[quizIndex];
                  List quizRandom = [
                    quizes[quizIndex].choice1,
                    quizes[quizIndex].choice2,
                    quizes[quizIndex].choice3,
                    quizes[quizIndex].answer,
                  ];
                  quizRandom.shuffle();
                  return Container(
                    height: 800,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          child: Image.file(File(memeQuiz.memeImageUrl)),
                        ),
                        Text(quizes[quizIndex].question),
                        Container(
                          height: 300,
                          width: 300,
                          child: Wrap(
                            children: quizRandom
                                .map((e) => GestureDetector(
                                    onTap: () {
                                      if (e == memeQuiz.answer) {
                                        print('correct');
                                      }
                                    },
                                    child: (QuestionList(e))))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }

  Widget QuestionList(String quiz) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Text(quiz.toString()),
    );
  }
}
