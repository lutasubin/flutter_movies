import 'package:flutter/material.dart';

import 'package:flutter_firebase/core/utils/dot_env_until.dart';
import 'package:flutter_firebase/presentation/screens/now_playing_movies_screen.dart';

Future<void> main() async {
  await DotEnvUtil.initDotEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: NowPlayingMoviesScreen(),
      ),
    );
  }
}
