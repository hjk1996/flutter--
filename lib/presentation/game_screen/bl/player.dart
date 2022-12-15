import 'package:text_project/presentation/game_screen/bl/player_abc.dart';

class Player extends HumanPlayerABC {
  Player({
    required super.referee,
    required super.id,
  });

  @override
  Future move() async {}


  @override
  void init() {
    // refereeSubscription = referee.refereeResponseStream.listen(
    //   (response) {
    //     // if (response.responseTypes == RefereeResponseTypes.askNextMove) {
    //     //   if (response.target == id) move();
    //     // }
    //   },
    // );
  }

  @override
  void dispose() {
    refereeSubscription?.cancel();
    refereeSubscription = null;
  }
}
