import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_project/domain/model/rank_board.dart';
import 'package:text_project/domain/model/ranker.dart';
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
      final info = await firestoreRepo.fetchTop5UserInformation();
      final easyInfo = info['easy']!;

      final easyRankers = easyInfo
          .asMap()
          .map(
            (index, i) => MapEntry(
              index,
              Ranker(
                rank: index + 1,
                name: i.name,
                photo: i.photoUrl != null ? Image.network(i.photoUrl!) : null,
                wins: i.easyWinCount,
              ),
            ),
          )
          .values
          .toList();

      if (easyRankers.length < 5) {
        final emptyRankers = List.generate(
          5 - easyRankers.length,
          (index) => Ranker(
            rank: null,
            name: null,
            photo: null,
            wins: null,
          ),
        );
        easyRankers.addAll(emptyRankers);
      }

      final normalInfo = info['normal']!;

      final normalRankers = normalInfo
          .asMap()
          .map(
            (index, i) => MapEntry(
              index,
              Ranker(
                rank: index + 1,
                name: i.name,
                photo: i.photoUrl != null ? Image.network(i.photoUrl!) : null,
                wins: i.normalWinCount,
              ),
            ),
          )
          .values
          .toList();

      if (normalRankers.length < 5) {
        final emptyRankers = List.generate(
          5 - normalRankers.length,
          (index) => Ranker(
            rank: null,
            name: null,
            photo: null,
            wins: null,
          ),
        );
        normalRankers.addAll(emptyRankers);
      }

      final hardInfo = info['hard']!;

      final hardRankers = hardInfo
          .asMap()
          .map(
            (index, i) => MapEntry(
              index,
              Ranker(
                rank: index + 1,
                name: i.name,
                photo: i.photoUrl != null ? Image.network(i.photoUrl!) : null,
                wins: i.hardWinCount,
              ),
            ),
          )
          .values
          .toList();

      if (hardRankers.length < 5) {
        final emptyRankers = List.generate(
          5 - hardRankers.length,
          (index) => Ranker(
            rank: null,
            name: null,
            photo: null,
            wins: null,
          ),
        );
        hardRankers.addAll(emptyRankers);
      }

      final impossibleInfo = info['impossible']!;
      final impossibleRankers = impossibleInfo
          .asMap()
          .map(
            (index, i) => MapEntry(
              index,
              Ranker(
                rank: index + 1,
                name: i.name,
                photo: i.photoUrl != null ? Image.network(i.photoUrl!) : null,
                wins: i.impossibleWinCount,
              ),
            ),
          )
          .values
          .toList();

      if (impossibleRankers.length < 5) {
        final emptyRankers = List.generate(
          5 - impossibleRankers.length,
          (index) => Ranker(
            rank: null,
            name: null,
            photo: null,
            wins: null,
          ),
        );
        impossibleRankers.addAll(emptyRankers);
      }

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
