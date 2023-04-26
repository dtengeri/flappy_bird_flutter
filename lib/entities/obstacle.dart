import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_flutter/components/crate_stack.dart';
import 'package:flappy_bird_flutter/flappy_bird_game.dart';

class Obstacle extends PositionComponent with HasGameRef<FlappyBirdGame> {
  final Random _random = Random();

  @override
  FutureOr<void> onLoad() {
    final isBottom = _random.nextBool();

    final maxStackSize = (gameRef.size.y ~/ 64) - 3;
    final stackSize = _random.nextInt(maxStackSize) + 1;
    final crateStack = CrateStack(stackSize);
    if (isBottom) {
      crateStack.position = Vector2(
        0,
        gameRef.size.y - crateStack.size.y,
      );
    } else {
      crateStack.position = Vector2.zero();
    }
    add(crateStack);
    position.x = gameRef.size.x;
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= 200 * dt;

    if (position.x < -64) {
      removeFromParent();
    }
  }
}
