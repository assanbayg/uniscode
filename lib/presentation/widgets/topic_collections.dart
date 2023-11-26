import 'package:flutter/material.dart';
import 'package:uniscode/presentation/screens/options.dart';

class TopicCollections extends StatelessWidget {
  const TopicCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Collections',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Collection(
                    iconData: Icons.soup_kitchen_outlined,
                    collectionName: 'Culinary'),
                Collection(
                    iconData: Icons.video_label_rounded,
                    collectionName: 'Movies'),
                Collection(
                    iconData: Icons.school_outlined, collectionName: 'School'),
                Collection(
                    iconData: Icons.local_hospital_outlined,
                    collectionName: 'Health'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Collection extends StatelessWidget {
  final IconData iconData;
  final String collectionName;

  const Collection({
    super.key,
    required this.iconData,
    required this.collectionName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OptionScreen.routeName,
            arguments: collectionName);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 5,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary,
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade300,
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  iconData,
                  size: 80,
              )),
          Text(
            collectionName,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    ));
  }
}
