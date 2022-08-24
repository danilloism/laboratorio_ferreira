import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/notifiers/router_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/services/router_service.dart';

final routerServiceProvider =
    Provider((ref) => RouterService(notifier: RouterNotifier(ref), ref: ref));
