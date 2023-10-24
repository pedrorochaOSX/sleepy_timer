import 'package:flutter/material.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';
import 'package:sleepy_timer/routes/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Sleepy timer');
    setWindowMinSize(Size(450, 450));
    setWindowMaxSize(Size(500, 500));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
