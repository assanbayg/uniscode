import 'package:flutter/material.dart';
import 'package:uniscode/presentation/screens/graph_view_screen.dart';
import 'package:uniscode/presentation/screens/novella_screen.dart';

class OptionScreen extends StatelessWidget {
  static const routeName = '/options';
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, GraphViewScreen.routeName);
                },
                child: buildRoundedContainer('assets/graph-option.png',
                    'Vocabulary', Colors.blue.shade400),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NovellaScreen(),
                    ),
                  );
                },
                child: buildRoundedContainer(
                    'assets/story.png', 'Story', Colors.indigo.shade300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRoundedContainer(String imagePath, String title, Color color) {
    return Container(
      width: 240,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color, // You can change the color as per your preference
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 250,
            height: 250,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
