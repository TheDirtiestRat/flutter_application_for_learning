import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/models/note.dart';

class NoteProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  // for adding
  void addNote(String name, String content) {
    final newNote = Note(
      id: DateTime.now().toString(), // Simple unique ID
      name: name,
      content: content
    );
    _notes.add(newNote);
    notifyListeners(); // Updates the UI automatically
  }

  // for updating
  void updateNote(String id, String newName, String newContent) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index].name = newName;
      _notes[index].content = newContent;
      notifyListeners();
    }
  }

  // for deleting
  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}