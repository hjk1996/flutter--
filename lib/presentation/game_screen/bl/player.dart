import 'package:text_project/presentation/game_screen/bl/player_abc.dart';

class Player extends HumanPlayerABC {
  Player({
    required super.referee,
    required super.id,
  });

  @override
  Future move() async {}


  // TODO: 게임 화면에서 나갔다 다시 들어와서 게임 다시 시작하면 ROBOT 메시지가 같은 것이 두개씩 출력됨.
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
