import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_app/screen/play_screen.dart';
import 'package:youtube_player_app/screen/search_screen.dart';

//https://pub.dev/packages/youtube_player_flutter
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube player controller',
      theme: ThemeData(
        fontFamily: 'noto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}
