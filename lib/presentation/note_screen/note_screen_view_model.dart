import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:text_project/domain/model/note_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteScreenViewModel with ChangeNotifier {
  List<NoteItem> _notes = [];
  List<NoteItem> get notes => _notes;
  NoteScreenViewModel();

  Future<void> refresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? dataString = prefs.getString('notes');
    final List<dynamic> data = jsonDecode(dataString!);
    _notes = data.map((e) => NoteItem.fromJson(e)).toList();
    notifyListeners();
  }
}
