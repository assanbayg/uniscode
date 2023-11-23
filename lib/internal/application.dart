import 'package:flutter/material.dart';
import 'package:uniscode/presentation/graph_view_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uNIScode',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GraphViewScreen(),
      initialRoute: '/',
      routes: {
        GraphViewScreen.routeName: (context) => const GraphViewScreen(),
      },
    );
  }
}
