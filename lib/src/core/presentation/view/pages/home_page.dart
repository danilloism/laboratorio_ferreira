import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _controller;

  @override
  void initState() {
    _controller =
        PageController(initialPage: context.read<NavigationIndexCubit>().state);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navCubit = NavigationIndexCubit.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(child: Logo(height: 50)),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(Routes.settings.name),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          itemCount: navCubit.pages.length,
          itemBuilder: (ctx, index) => navCubit.pages[index],
          controller: _controller,
          onPageChanged: navCubit.goTo,
        ),
      ),
      bottomNavigationBar: BlocBuilder<NavigationIndexCubit, int>(
        builder: (ctx, state) => BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: state,
          onTap: (index) {
            if (index == state - 1 || index == state + 1) {
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
              return;
            }

            _controller.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Contatos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cases_rounded),
              label: 'Serviços',
            ),
          ],
        ),
      ),
    );
  }
}
