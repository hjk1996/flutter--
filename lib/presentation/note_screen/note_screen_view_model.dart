import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:text_project/domain/model/note_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_project/presentation/note_screen/note_screen_event.dart';

enum SortType {
  date,
  word,
}

class NoteScreenViewModel with ChangeNotifier {
  List<NoteItem> _notes = [];
  List<NoteItem> get notes => _notes;
  List<NoteItem> get favorites => notes.where((e) => e.isFavorite).toList();
  bool isFavoritesOnly = false;
  NoteItem? _lastDeletedNote;
  int? _lastDeletedNoteIndex;
  SortType _sortType = SortType.date;
  SortType get sortType => _sortType;

  final SharedPreferences _prefs = GetIt.instance<SharedPreferences>();
  final StreamController<NoteScreenEvent> _eventController =
      StreamController<NoteScreenEvent>.broadcast();

  Stream<NoteScreenEvent> get eventStream => _eventController.stream;

  NoteScreenViewModel();

  void onSortButtonPressed() {
    _eventController.sink.add(const NoteScreenEvent.onSortButtonPressed());
  }

  void setSortType(SortType value) {
    _sortType = value;
    notifyListeners();
  }

  void sort({bool asending = true}) {
    switch (_sortType) {
      case SortType.date:
        if (asending) {
          _notes.sort((a, b) => a.savedAt.compareTo(b.savedAt));
        } else {
          _notes.sort((a, b) => b.savedAt.compareTo(a.savedAt));
        }
        break;
      case SortType.word:
        if (asending) {
          _notes.sort((a, b) => b.word.compareTo(a.word));
        } else {
          _notes.sort((a, b) => a.word.compareTo(b.word));
        }
        break;
    }
    notifyListeners();
  }

  Future<void> toggleFavoritesOnly() async {
    isFavoritesOnly = !isFavoritesOnly;
    notifyListeners();
  }

  Future<void> loadNotes() async {
    final String? dataString = _prefs.getString('notes');
    final List<dynamic> data = jsonDecode(dataString ?? '[]');
    _notes = data.map((e) => NoteItem.fromJson(e)).toList();
    _notes.sort((a, b) => b.savedAt.compareTo(a.savedAt));
  }

  void updateWord(String word) {
    _notes = _notes
        .map((e) => e.word == word ? e.copyWith(isFavorite: !e.isFavorite) : e)
        .toList();
    notifyListeners();
  }

  Future<void> saveNotes() async {
    final data = _notes.map((e) => e.toJson()).toList();
    _prefs.setString('notes', jsonEncode(data));
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
