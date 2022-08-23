import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/repository/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/network/providers/dio_provider.dart';

final authRepositoryProvider =
    Provider((ref) => AuthRepository(client: ref.read(dioProvider)));
