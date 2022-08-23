import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/assets.dart';
import 'package:laboratorio_ferreira_mobile/src/configs/colors.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_notifier_provider.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/providers/auth_repository_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('HomePage'),
    );
  }
}
