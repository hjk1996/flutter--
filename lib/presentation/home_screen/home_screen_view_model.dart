import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_project/domain/model/rank_board.dart';
import 'package:text_project/domain/model/ranker.dart';
import 'package:text_project/domain/model/user_stat.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/presentation/home_screen/home_screen_event.dart';
import 'package:text_project/presentation/home_screen/home_screen_state.dart';

class HomeScreenViewModel with ChangeNotifier {
  final StreamController<HomeScreenEvent> _eventController =
      StreamController<HomeScreenEvent>.broadcast();
  Stream<HomeScreenEvent> get eventStream => _eventController.stream;
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  final FirestoreRepo firestoreRepo;
  final FirebaseStorageRepo firebaseStorageRepo;
  HomeScreenState _state = HomeScreenState(
    isLoading: false,
    rankBoard: null,
  );
  HomeScreenState get state => _state;

  HomeScreenViewModel({
    required this.firestoreRepo,
    required this.firebaseStorageRepo,
  });

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void onLogOutPressed() {
    _eventController.sink.add(
      const HomeScreenEvent.onLogoutPressed(),
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> onGameStart() async {
    _eventController.sink.add(const HomeScreenEvent.onGameStart());
  }

  Future<void> fetchRankBoard() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    try {
      final stats = await firestoreRepo.fetchTop10UserStats();
      final easyStats = stats['easy']!;
      final easyPhotos = await firebaseStorageRepo
          .getUserPhotos(easyStats.map((e) => e.uid).toList());
      final easyRankers = easyStats
          .asMap()
          .map(
            (index, stat) => MapEntry(
              index,
              Ranker(
                uid: stat.uid,
                rank: index + 1,
                name: stat.name,
                photo: easyPhotos[stat.uid],
                wins: stat.easyWinCount,
              ),
            ),
          )
          .values
          .toList();

      final normalStats = stats['normal']!;
      final normalPhotos = await firebaseStorageRepo
          .getUserPhotos(normalStats.map((e) => e.uid).toList());
      final normalRankers = normalStats
          .asMap()
          .map((index, stat) => MapEntry(
              index,
              Ranker(
                uid: stat.uid,
                rank: index + 1,
                name: stat.name,
                photo: normalPhotos[stat.uid],
                wins: stat.normalWinCount,
              )))
          .values
          .toList();

      final hardStats = stats['hard']!;
      final hardPhotos = await firebaseStorageRepo
          .getUserPhotos(hardStats.map((e) => e.uid).toList());
      final hardRankers = hardStats
          .asMap()
          .map((index, stat) => MapEntry(
              index,
              Ranker(
                uid: stat.uid,
                rank: index + 1,
                name: stat.name,
                photo: hardPhotos[stat.uid],
                wins: stat.hardWinCount,
              )))
          .values
          .toList();

      final impossibleStats = stats['impossible']!;
      final impossiblePhotos = await firebaseStorageRepo
          .getUserPhotos(impossibleStats.map((e) => e.uid).toList());
      final impossibleRankers = impossibleStats
          .asMap()
          .map((index, stat) => MapEntry(
              index,
              Ranker(
                uid: stat.uid,
                rank: index + 1,
                name: stat.name,
                photo: impossiblePhotos[stat.uid],
                wins: stat.impossibleWinCount,
              )))
          .values
          .toList();

      _state = _state.copyWith(
        rankBoard: RankBoard(
          easyRankers: easyRankers,
          normalRankers: normalRankers,
          hardRankers: hardRankers,
          impossibleRankers: impossibleRankers,
        ),
      );
    } catch (err) {
      _eventController.sink.add(
        HomeScreenEvent.onError(err.toString()),
      );
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }
}
