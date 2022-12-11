import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:text_project/domain/model/note_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_project/presentation/note_screen/note_screen_event.dart';

class NoteScreenViewModel with ChangeNotifier {
  List<NoteItem> _notes = [];
  List<NoteItem> get notes => _notes;
  NoteItem? _lastDeletedNote;
  int? _lastDeletedNoteIndex;
  final StreamController<NoteScreenEvent> _eventController =
      StreamController<NoteScreenEvent>.broadcast();
  Stream<NoteScreenEvent> get eventStream => _eventController.stream;

  NoteScreenViewModel();

  Future<void> refresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? dataString = prefs.getString('notes');
    final List<dynamic> data = jsonDecode(dataString!);
    _notes = data.map((e) => NoteItem.fromJson(e)).toList();
    notifyListeners();
  }

  void updateWord(String word) {
    _notes = _notes
        .map((e) => e.word == word ? e.copyWith(isFavorite: !e.isFavorite) : e)
        .toList();
    notifyListeners();
  }

  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = _notes.map((e) => e.toJson()).toList();
    prefs.setString('notes', jsonEncode(data));
  }

  Future<void> toggleFavorite(String word) async {
    _notes = _notes
        .map((e) => e.word == word ? e.copyWith(isFavorite: !e.isFavorite) : e)
        .toList();
    await saveNotes();
    notifyListeners();
  }

  Future<void> deleteWord(String word) async {
    _lastDeletedNoteIndex = _notes.indexWhere((e) => e.word == word);
    _lastDeletedNote = _notes.firstWhere((e) => e.word == word);
    _notes = _notes.where((e) => e.word != word).toList();
    await saveNotes();
    notifyListeners();
    saveNotes();
    _eventController.sink.add(
      NoteScreenEvent.onDelete(_lastDeletedNote!.word),
    );
  }

  Future<void> cancelDelete() async {
    if (_lastDeletedNote != null && _lastDeletedNoteIndex != null) {
      _notes.insert(_lastDeletedNoteIndex!, _lastDeletedNote!);
      _lastDeletedNote = null;
      _lastDeletedNoteIndex = null;
      await saveNotes();
      notifyListeners();
    }
  }
}
