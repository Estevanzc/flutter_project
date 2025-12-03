import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_project/models/note_model.dart';

class DataProvider extends ChangeNotifier {
  List<Note> _notes = [];
  List<Task> _tasks = [];

  List<Note> get notes => _notes;
  List<Task> get tasks => _tasks;

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    
    List<String>? savedNotes = prefs.getStringList('notes');
    if (savedNotes != null) {
      _notes = savedNotes.map((e) => Note.fromJson(e)).toList();
    }

    List<String>? savedTasks = prefs.getStringList('tasks');
    if (savedTasks != null) {
      _tasks = savedTasks.map((e) => Task.fromJson(e)).toList();
    }
    
    notifyListeners();
  }

  void addNote(String title, String content) {
    Note newNote = Note(
      title: title, 
      content: content, 
      date: DateTime.now()
    );
    _notes.add(newNote);
    _saveNotes();
    notifyListeners();
  }

  // --- NEW: Update an existing note ---
  void updateNote(int index, String title, String content) {
    _notes[index].title = title;
    _notes[index].content = content;
    _notes[index].date = DateTime.now(); // Update the time to "Just now"
    _saveNotes();
    notifyListeners();
  }
  // ------------------------------------

  void addTask(String title, String description) {
    Task newTask = Task(
      title: title, 
      description: description
    );
    _tasks.add(newTask);
    _saveTasks();
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    _saveNotes();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    _saveTasks();
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    _saveTasks();
    notifyListeners();
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = _notes.map((n) => n.toJson()).toList();
    await prefs.setStringList('notes', stringList);
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = _tasks.map((t) => t.toJson()).toList();
    await prefs.setStringList('tasks', stringList);
  }
}