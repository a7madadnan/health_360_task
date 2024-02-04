import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart'; // This is the generated file

@JsonSerializable()
class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  final String? title;
  final String? id;
  final String? description;
  final DateTime? createdAt;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  Note copyWith({
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Note(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Note.decode(String value) => Note.fromJson(jsonDecode(value));

  String encode() => json.encode(toJson());
}
