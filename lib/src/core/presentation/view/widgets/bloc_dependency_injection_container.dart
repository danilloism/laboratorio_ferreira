import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDependencyInjectionContainer extends StatelessWidget {
  const BlocDependencyInjectionContainer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InitialBlocsProvider(
      child: _RepositoriesProvider(
        child: _Listeners(child: child),
      ),
    );
  }
}

class _InitialBlocsProvider extends StatelessWidget {
  const _InitialBlocsProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: child,
    );
  }
}

class _RepositoriesProvider extends StatelessWidget {
  const _RepositoriesProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: child,
    );
  }
}

class _Listeners extends StatelessWidget {
  const _Listeners({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // BlocListener<RefreshTokenOnAppInitializationCubit, bool>(
        //   listenWhen: (previous, current) => !previous && current,
        //   listener: (context, state) async {
        //     final settingsBloc = SettingsBloc.of(context);
        //     final tokenUsuarioLogado = settingsBloc.state.session!.accessToken;
        //     final decodedToken = JwtDecoder.decode(tokenUsuarioLogado);
        //     final iat = DateTime.fromMillisecondsSinceEpoch(0)
        //         .add(Duration(seconds: decodedToken['iat']));
        //     final dataAtual = DateTime.now();
        //     final diferencaDias = iat.day - dataAtual.day;
        //     if (diferencaDias <= 2) return;
        //
        //     context.read<AuthRepository>().refreshToken().then((refreshToken) {
        //       if (AuthBloc.of(context).state is LoggedOut) return;
        //       final newSession = settingsBloc.state.session!
        //           .copyWith(accessToken: refreshToken.accessToken);
        //       settingsBloc.add(SettingsEvent.sessionChanged(newSession));
        //     });
        //   },
        // ),
      ],
      child: child,
    );
  }
}
