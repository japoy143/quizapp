// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizAdapter extends TypeAdapter<Quiz> {
  @override
  final int typeId = 0;

  @override
  Quiz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quiz(
      memeImageUrl: fields[1] as String,
      question: fields[2] as String,
      answer: fields[3] as String,
      choice1: fields[4] as String,
      choice2: fields[5] as String,
      choice3: fields[6] as String,
    )..id = fields[0] == null ? 0 : fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, Quiz obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.memeImageUrl)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.answer)
      ..writeByte(4)
      ..write(obj.choice1)
      ..writeByte(5)
      ..write(obj.choice2)
      ..writeByte(6)
      ..write(obj.choice3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
