import 'dart:io';

import 'package:app3/Models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class AddQuizPage extends StatefulWidget {
  const AddQuizPage({super.key});

  @override
  State<AddQuizPage> createState() => _AddQuizPageState();
}

class _AddQuizPageState extends State<AddQuizPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _question = TextEditingController();
  TextEditingController _choice1 = TextEditingController();
  TextEditingController _choice2 = TextEditingController();
  TextEditingController _choice3 = TextEditingController();
  TextEditingController _answer = TextEditingController();

  XFile? _image;

  //db
  late Box<Quiz> quizBox;
  @override
  void initState() {
    quizBox = Hive.box<Quiz>('quizBox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _image != null
              ? Container(
                  height: 500,
                  width: 500,
                  child: Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: Text('question'),
                    ),
                    autocorrect: false,
                    controller: _question,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('choice1'),
                    ),
                    autocorrect: false,
                    controller: _choice1,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('choice2'),
                    ),
                    autocorrect: false,
                    controller: _choice2,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('choice3'),
                    ),
                    autocorrect: false,
                    controller: _choice3,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('answer'),
                    ),
                    autocorrect: false,
                    controller: _answer,
                  ),
                  ElevatedButton.icon(
                      onPressed: _image != null ? saveQuiz : null,
                      icon: Icon(Icons.add),
                      label: Text('Save')),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => getImage(ImageSource.gallery),
        label: Text('Add Image'),
        icon: Icon(Icons.image),
      ),
    );
  }

  ImagePicker picker = ImagePicker();

  void getImage(ImageSource source) async {
    try {} catch (e) {
      final image = await picker.pickImage(source: source);

      if (image == null) return;

      setState(() {
        _image = image;
      });
      print('Caught error $e');
    }
  }

  void saveQuiz() {
    try {
      quizBox.add(Quiz(
          memeImageUrl: _image!.path,
          question: _question.text,
          answer: _answer.text,
          choice1: _choice1.text,
          choice2: _choice2.text,
          choice3: _choice3.text));
    } catch (e) {
      print('data not save caught error $e');
    }
  }
}
