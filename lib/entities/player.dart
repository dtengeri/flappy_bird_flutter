import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird_flutter/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final sprites = await Future.wait(
      [
        for (var i = 1; i <= 4; i++) Sprite.load('player/player_frame_0$i.png'),
      ],
    );

    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 0.1,
    );
    size = Vector2(76, 60.3);
    position = Vector2(100, 100);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += 200 * dt;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameRef.pauseEngine();
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(
          duration: 0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
