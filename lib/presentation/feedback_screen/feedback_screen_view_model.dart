import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/feedback_screen/feedback_screen_event.dart';
import 'package:text_project/presentation/feedback_screen/feedback_screen_state.dart';

class FeedbackScreenViewModel with ChangeNotifier {
  final FirestoreRepo firestoreRepo;
  FeedbackScreenState _state = FeedbackScreenState(isLoading: false);
  FeedbackScreenState get state => _state;
  final StreamController<FeedbackScreenEvent> _eventController =
      StreamController<FeedbackScreenEvent>.broadcast();
  Stream<FeedbackScreenEvent> get eventStream => _eventController.stream;
  FeedbackScreenViewModel({required this.firestoreRepo});

  Future<void> sendFeedback(String title, String content) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    try {
      await firestoreRepo.sendFeedback(title, content);
      _eventController.sink.add(const FeedbackScreenEvent.onSuccess());
    } on FirebaseException catch (err) {
      _eventController.sink.add(FeedbackScreenEvent.onError(err.toString()));
    } catch (err) {
      _eventController.sink.add(FeedbackScreenEvent.onError(err.toString()));
    }
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
