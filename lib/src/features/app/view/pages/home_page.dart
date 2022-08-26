import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/view/widgets/logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            height: Theme.of(context).appBarTheme.toolbarHeight! - 15,
            child: const Logo()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const SafeArea(
        child: SizedBox.expand(),
      ),
    );
  }
}
