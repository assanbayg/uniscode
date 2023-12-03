import 'package:flutter/material.dart';

class NovellaScreen extends StatefulWidget {
  @override
  _NovellaScreenState createState() => _NovellaScreenState();
}

class _NovellaScreenState extends State<NovellaScreen> {
  int currentPage = 0;

  List<String> pages = [
    "You find yourself at a bustling fruit market, the air filled with the sweet aroma of nature's bounty. As you make your way through the vibrant stalls, your eyes catch sight of a lively vendor selling an array of ripe and colorful fruits. Intrigued, you approach the vendor's stall, where a large basket sits prominently, brimming with an inviting assortment of ..",
    "The sun casts its warm rays upon the exquisite fruits, enhancing their vibrant hues and enticing you to explore further. Each fruit seems to possess its own unique allure: the glossy, crimson apples whisper of refreshing juiciness; the sunny, yellow bananas radiate a subtle yet undeniable charm; and the plump, luscious cherries entice with their vibrant red skins.",
    "A language teacher approaches you and offers two language learning options:\n1. Join a local language exchange program.\n2. Take an intensive language course online.",
    // Add more pages as needed
  ];

  List<String> options = ['fruits', 'mouses', 'go on', 'stay', 'join', 'leave'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Learning Adventure'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/fruit.png'),
            Text(
              pages[currentPage],
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentPage < pages.length - 1) {
                    currentPage++;
                  }
                });
              },
              child: Text(options[currentPage * 2]),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentPage < pages.length - 1) {
                    currentPage++;
                  }
                });
              },
              child: Text(options[currentPage * 2 + 1]),
            ),
          ],
        ),
      ),
    );
  }
}
