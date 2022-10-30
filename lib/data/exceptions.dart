import 'package:sqflite/sqflite.dart';

class DBNotExistsError implements Exception {
  final String? _message;
  String? get message => _message;
  DBNotExistsError(String? message) : _message = message;
}
