import 'package:flutter/material.dart';
import 'package:uniscode/presentation/screens/graph_view_screen.dart';

class SearchCollectionWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchCollectionWidget({super.key});

  void _search(BuildContext context) {
    Navigator.pushNamed(context, GraphViewScreen.routeName,
        arguments: _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Theme.of(context).colorScheme.primary,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _search(context),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
