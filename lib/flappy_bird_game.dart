import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_flutter/components/crate.dart';

class FlappyBirdGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    add(Crate());
  }
}
