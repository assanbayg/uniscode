import 'package:flutter/material.dart';
import 'package:graphview/graphview.dart';

class CirlceNodeWidget extends StatelessWidget {
  final Node node;

  const CirlceNodeWidget(this.node, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // this should display meaning of word
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(node.key!.value),
      ),
    );
  }
}
