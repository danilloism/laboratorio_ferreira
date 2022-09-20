import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          const Expanded(child: TextField()),
          const SizedBox(width: 8),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
