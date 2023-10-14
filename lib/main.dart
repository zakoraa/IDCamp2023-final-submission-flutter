import 'package:flutter/material.dart';
import 'package:jkt48_app/module/home/view/home_view.dart';
import 'package:jkt48_app/shared/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const HomeView(),
    );
  }
}
