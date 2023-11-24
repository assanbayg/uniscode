import 'package:flutter/material.dart';
import 'package:uniscode/presentation/widgets/phrase_day_widget.dart';
import 'package:uniscode/presentation/widgets/search_collection_widget.dart';
import 'package:uniscode/presentation/widgets/topic_collections.dart';
import 'package:uniscode/presentation/widgets/topic_day_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopicOfDayWidget(),
            SearchCollectionWidget(),
            const TopicCollections(),
            const PhraseOfDayWidget(),
          ],
        ),
      ),
    );
  }
}
