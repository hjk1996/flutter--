import 'dart:async';

import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';

abstract class PlayerABC {
  final Referee referee;
  String? id;
  PlayerABC({required this.referee, this.id});
  void disposeGame() {
    refereeSubscription?.cancel();
  }

  StreamSubscription<RefereeResponse>? refereeSubscription;

  void init();

  void dispose() {
    refereeSubscription?.cancel();
    refereeSubscription = null;
  }

  Future<void> move();
}

abstract class HumanPlayerABC extends PlayerABC {
  HumanPlayerABC({
    required super.referee,
    required super.id,
  });

  @override
  StreamSubscription<RefereeResponse>? refereeSubscription;
}

abstract class RobotPlayerABC extends PlayerABC {
  final FirestoreRepo wordsRepo;
  RobotPlayerABC({
    required super.referee,
    super.id,
    required this.wordsRepo,
  });

  @override
  StreamSubscription<RefereeResponse>? refereeSubscription;

  Future<String> pickRandomStarter() async {
    return wordsRepo.getRandomNonKillerWord();
    // return referee.receiveMessage(
    //   Message(
    //       id: id!,
    //       messageType: MessageType.playing,
    //       content: word,
    //       createdAt: DateTime.now().microsecondsSinceEpoch),
    // );
  }
}
