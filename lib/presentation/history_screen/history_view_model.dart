import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/history_screen/history_screen_event.dart';
import 'package:text_project/presentation/history_screen/history_state.dart';

class HistoryViewModel with ChangeNotifier {
  final FirestoreRepo _storeRepo;
  HistoryState _state = HistoryState(
    isLoading: false,
    gameLogs: [],
  );
  HistoryState get state => _state;
  HistoryViewModel({required FirestoreRepo storeRepo}) : _storeRepo = storeRepo;
  final _eventController = StreamController<HistoryScreenEvent>.broadcast();
  Stream<HistoryScreenEvent> get eventStream => _eventController.stream;
  Future<void> fetchRecentGames() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final gameLogs = await _storeRepo.fetchUserGameLogs(10);
      _state = _state.copyWith(gameLogs: gameLogs);
    } on FirebaseException catch (e) {
      _eventController.sink
          .add(HistoryScreenEvent.onError('최근 전적을 불러오는데 실패했습니다. ${e.code}'));
    } catch (e) {
      _eventController.sink
          .add(HistoryScreenEvent.onError('최근 전적을 불러오는데 실패했습니다. $e'));
    } finally {
      _state = _state.copyWith(isLoading: false);

      notifyListeners();
    }
  }
}
