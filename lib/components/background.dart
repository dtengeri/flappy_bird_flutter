import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_flutter/flappy_bird_game.dart';

class Backround extends ParallaxComponent<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData('parallax/parallax_layer_01.png'),
      ParallaxImageData('parallax/parallax_layer_02.png'),
      ParallaxImageData('parallax/parallax_layer_03.png'),
      ParallaxImageData('parallax/parallax_layer_04.png'),
    ]);

    parallax?.baseVelocity = Vector2(200, 0);
  }
}
