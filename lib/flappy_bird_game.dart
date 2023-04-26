import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_bird_flutter/components/background.dart';
import 'package:flappy_bird_flutter/entities/obstacle.dart';
import 'package:flappy_bird_flutter/entities/player.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late final Player _player;

  double _timeSinceLastObstacle = 0;
  final double _obstacleInterval = 1;

  @override
  FutureOr<void> onLoad() {
    add(Backround());
    _player = Player();
    add(_player);
    add(ScreenHitbox());
  }

  @override
  void onTap() {
    _player.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceLastObstacle += dt;
    if (_timeSinceLastObstacle > _obstacleInterval) {
      _timeSinceLastObstacle = 0;
      add(Obstacle());
    }
  }
}
