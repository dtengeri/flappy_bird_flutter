import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Crate extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('crate.png');
    size = Vector2.all(64);

    add(RectangleHitbox());
  }
}
