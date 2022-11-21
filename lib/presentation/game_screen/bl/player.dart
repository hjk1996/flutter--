import 'package:text_project/presentation/game_screen/bl/player_abc.dart';

class Player extends HumanPlayerABC {
  Player({
    required super.referee,
    required super.id,
  });


  @override
  Future move() async {}
}
