import 'dart:async';

import 'package:text_project/domain/model/message.dart';
import 'package:text_project/domain/repository/words_repo.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';

abstract class PlayerABC {
  final Referee referee;
  String? id;
  PlayerABC({required this.referee, this.id});
  void disposeGame() {
    refereeSubscription?.cancel();
  }

  StreamSubscription<RefereeResponse>? refereeSubscription;

  void init() {}

  Future<void> move();
}

abstract class HumanPlayerABC extends PlayerABC {
  HumanPlayerABC({
    required super.referee,
    required super.id,
  });

  @override
  StreamSubscription<RefereeResponse>? get refereeSubscription =>
      super.refereeSubscription;
}

abstract class RobotPlayerABC extends PlayerABC {
  final WordsRepo wordsRepo;
  RobotPlayerABC({
    required super.referee,
    super.id,
    required this.wordsRepo,
  });

  @override
  StreamSubscription<RefereeResponse>? get refereeSubscription =>
      super.refereeSubscription;

  Future<void> pickRandomStarter() async {
    final word = await wordsRepo.getRandomNonKillerWord();
    return referee.receiveMessage(
      Message(
          id: id!,
          messageType: MessageType.playing,
          content: word,
          createdAt: DateTime.now().microsecondsSinceEpoch),
    );
  }
}
