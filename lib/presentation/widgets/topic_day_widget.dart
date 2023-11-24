import 'package:flutter/material.dart';

class TopicOfDayWidget extends StatelessWidget {
  const TopicOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String topicOfDay = 'cooking';

    return ClipPath(
      clipper: RoundedBottomClipper(),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade300,
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        child: Row(
          children: [
            // some random image for now
            SizedBox(
                width: 250,
                child: Image.asset(
                  'assets/curious-dude.png',
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hot Topic",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleLarge!
                      .copyWith(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(topicOfDay,
                    style: Theme.of(context).primaryTextTheme.headlineSmall),
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 50,
                      color: Colors.amber,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RoundedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50.0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50.0);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
