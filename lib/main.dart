import 'package:flame/game.dart';
import 'package:flappy_bird_flutter/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  /// Wait for Flutter to initialize.
  WidgetsFlutterBinding.ensureInitialized();

  /// Set the orientation to landscape.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(
    GameWidget(
      game: FlappyBirdGame(),
    ),
  );
}
