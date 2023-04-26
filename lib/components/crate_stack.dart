import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird_flutter/components/crate.dart';

class CrateStack extends PositionComponent {
  CrateStack(this.stackSize) {
    size = Vector2(64, 64.0 * stackSize);
  }

  final int stackSize;

  @override
  FutureOr<void> onLoad() {
    for (var i = 0; i < stackSize; i++) {
      final crate = Crate();
      crate.position = Vector2(0, i * 64);
      add(crate);
    }
  }
}
