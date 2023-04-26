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

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
