import 'dart:convert';

class Note {
  String title;
  String content;
  DateTime date;

  Note({required this.title, required this.content, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
    );
  }

  String toJson() => json.encode(toMap());
  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}

class Task {
  String title;
  String description; // <--- NEW: Added description field
  bool isDone;

  Task({
    required this.title,
    this.description = '', // <--- NEW: Default to empty string
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description, // <--- NEW: Save description
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'] ?? '', // <--- NEW: Load description
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}