import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/servico.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';

enum HomePageTabs {
  inicio,
  contatos,
  servicos;

  Widget get page {
    switch (this) {
      case HomePageTabs.inicio:
        return const InicioPageView();
      case HomePageTabs.contatos:
        return const ContatosPageView();
      case HomePageTabs.servicos:
        return const ServicosPageView();
    }
  }
}

final _contatoComCategoriaProviderCreateMap = {
  'dentista': (BuildContext _) => EditorContatoCubit(Contato.emptyDentista),
  'paciente': (BuildContext _) => EditorContatoCubit(Contato.emptyPaciente),
  'dentistaEspOdont': (BuildContext _) =>
      EditorContatoCubit(Contato.emptyDentistaEspacoOdontologico),
};

enum Routes {
  home(path: '/:tab(inicio|contatos|servicos)'),
  inicio(path: '/inicio'),
  contatos(path: '/contatos'),
  detalhesContato(path: 'detalhes/:uid'),
  editarContato(path: 'editar'),
  criarContato(path: 'criar'),
  criarContatoComCategoriaEspecifica(path: ':categoria'),
  servicos(path: '/servicos'),
  welcome(path: '/welcome'),
  settings(path: '/settings'),
  login(path: '/login');

  final String path;

  const Routes({required this.path});

  String? Function(GoRouterState)? get redirect {
    switch (this) {
      case Routes.inicio:
        return (state) => state.namedLocation(
              Routes.home.name,
              params: {'tab': HomePageTabs.inicio.name},
            );
      case Routes.contatos:
        return (state) => state.namedLocation(
              Routes.home.name,
              params: {'tab': HomePageTabs.contatos.name},
            );
      case Routes.servicos:
        return (state) => state.namedLocation(
              Routes.home.name,
              params: {'tab': HomePageTabs.servicos.name},
            );
      default:
        return null;
    }
  }

  Widget Function(BuildContext, GoRouterState)? get builder {
    switch (this) {
      case Routes.home:
        return (_, state) {
          final tab = HomePageTabs.values.byName(state.params['tab']!);
          return BlocProvider<NavigationIndexCubit>(
            create: (_) => NavigationIndexCubit(tab.index),
            child: const HomePage(),
          );
        };

      case Routes.editarContato:
        return (ctx, state) {
          final uid = state.params['uid'];
          final sessionContato = SettingsBloc.of(ctx).state.session?.contato;
          final itsMe = uid == 'me' || uid == sessionContato?.uid;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) =>
                      EditorContatoCubit(itsMe ? sessionContato : null)),
              BlocProvider(create: (_) => EditorContatoStepCubit()),
            ],
            child: const EditorContatoPage(),
          );
        };

      case Routes.criarContato:
        return (_, __) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => EditorContatoCubit()),
                BlocProvider(create: (_) => EditorContatoStepCubit()),
              ],
              child: const EditorContatoPage(),
            );

      case Routes.criarContatoComCategoriaEspecifica:
        return (_, state) {
          final categoria = state.params['categoria'];
          if (categoria == 'dentista' ||
              categoria == 'paciente' ||
              categoria == 'dentistaEspOdont') {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: _contatoComCategoriaProviderCreateMap[categoria]!),
                BlocProvider(create: (_) => EditorContatoStepCubit()),
              ],
              child: const EditorContatoPage(),
            );
          }

          throw Exception();
        };

      case Routes.detalhesContato:
        return (ctx, state) {
          final uid = state.params['uid'];
          final sessionContato = SettingsBloc.of(ctx).state.session?.contato;
          // ignore: unused_local_variable
          final itsMe = uid == 'me' || uid == sessionContato?.uid;
          //TODO

          return DetalhesContatoPage(
              SettingsBloc.of(ctx).state.session!.contato);
        };

      case Routes.welcome:
        return (_, __) {
          return const WelcomePage();
        };

      case Routes.settings:
        return (_, __) {
          return const SettingsPage();
        };

      case Routes.login:
        return (_, __) => BlocProvider<LoginFormCubit>(
              create: (_) => LoginFormCubit(),
              child: const LoginPage(),
            );

      default:
        return null;
    }
  }
}
