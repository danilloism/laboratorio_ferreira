import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/local_storage/services/local_storage_service.dart';

final localStorageProvider = Provider((ref) => LocalStorageService());
