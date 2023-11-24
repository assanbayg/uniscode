import 'package:flutter/material.dart';
import 'package:uniscode/themes.dart';
import 'package:uniscode/presentation/screens/graph_view_screen.dart';
import 'package:uniscode/presentation/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uNIScode',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        GraphViewScreen.routeName: (context) => GraphViewScreen(),
      },
    );
  }
}
