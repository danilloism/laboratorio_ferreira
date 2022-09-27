import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/config/config.dart';
import 'package:laboratorio_ferreira_mobile/src/core/bloc/app_initialized_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/common.dart';
import 'package:laboratorio_ferreira_mobile/src/features/settings/settings.dart';
import 'package:sembast/sembast.dart';

class BlocDependencyInjectionContainer extends StatelessWidget {
  const BlocDependencyInjectionContainer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InitialBlocsProvider(
      child: _RepositoriesProvider(
        child: BlocProvider(
          create: (context) => RefreshTokenOnAppInitializationCubit(
            connectivityResultStream: context.read<ConnectivityCubit>().stream,
            appInitializedLoggedIn:
                SettingsBloc.of(context).state.session != null,
          ),
          child: _Listeners(child: child),
        ),
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
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: GetIt.I.get(),
            localSession:
                GetIt.I.get<SettingsRepository>().activeStored.session,
          )..add(const AuthEvent.appInitialized()),
        ),
        BlocProvider(create: (_) => SettingsBloc(settingsRepo: GetIt.I.get())),
        BlocProvider(
            create: (_) => ConnectivityCubit(GetIt.I
                .get(instanceName: Constants.initialConnectivityInstanceName))),
      ],
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
      providers: [
        RepositoryProvider<IHttpService>(
            create: (_) => GetIt.I.get<IHttpService>()),
        RepositoryProvider<Database>(create: (_) => GetIt.I.get<Database>()),
        RepositoryProvider<SettingsRepository>(
            create: (_) => GetIt.I.get<SettingsRepository>()),
        RepositoryProvider<AuthRepository>(
            create: (_) => GetIt.I.get<AuthRepository>()),
        RepositoryProvider<RouterService>(
            create: (context) => RouterService(AuthBloc.of(context))),
        RepositoryProvider(
          create: (_) =>
              ContatoRepository(httpService: GetIt.I.get<IHttpService>()),
        ),
      ],
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
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (_, current) {
            return current.maybeWhen(
              loggedIn: (session) {
                return session != SettingsBloc.of(context).state.session;
              },
              loggedOut: () {
                return SettingsBloc.of(context).state.session != null;
              },
              orElse: () => false,
            );
          },
          listener: (ctx, state) {
            state.whenOrNull(
              loggedIn: (session) => SettingsBloc.of(ctx).add(
                SettingsEvent.sessionChanged(session),
              ),
              loggedOut: () => SettingsBloc.of(ctx)
                  .add(const SettingsEvent.sessionChanged()),
            );
          },
        ),
        BlocListener<RefreshTokenOnAppInitializationCubit, bool>(
          listenWhen: (previous, current) => !previous && current,
          listener: (context, state) async {
            final settingsBloc = SettingsBloc.of(context);
            final tokenUsuarioLogado = settingsBloc.state.session!.accessToken;
            final decodedToken = JwtDecoder.decode(tokenUsuarioLogado);
            final iat = DateTime.fromMillisecondsSinceEpoch(0)
                .add(Duration(seconds: decodedToken['iat']));
            final dataAtual = DateTime.now();
            final diferencaDias = iat.day - dataAtual.day;
            if (diferencaDias <= 2) return;

            context.read<AuthRepository>().refreshToken().then((refreshToken) {
              if (AuthBloc.of(context).state is LoggedOut) return;
              final newSession = settingsBloc.state.session!
                  .copyWith(accessToken: refreshToken.accessToken);
              settingsBloc.add(SettingsEvent.sessionChanged(newSession));
            });
          },
        ),
      ],
      child: child,
    );
  }
}
