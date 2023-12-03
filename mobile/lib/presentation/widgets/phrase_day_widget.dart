import 'package:flutter/material.dart';

class PhraseOfDayWidget extends StatelessWidget {
  const PhraseOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Phrase of day',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width * 2 / 3,
          height: MediaQuery.of(context).size.height / 7,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withAlpha(90),
                blurRadius: 20,
                spreadRadius: 10,
                offset: const Offset(
                  0.0,
                  3.0,
                ),
              ),
            ],
          ),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            '"It\'s a piece of cake"\n"Это просто"',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
