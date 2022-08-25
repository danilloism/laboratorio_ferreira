import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/helpers/jwt_helper.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/notifiers/token_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/repository/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/services/local_token_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/services/user_session_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/state/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LocalTokenService _localTokenService;
  final TokenNotifier _tokenNotifier;
  final UserSessionService _userSessionService;
  final AuthRepository _authRepo;
  AuthNotifier({
    Session? session,
    required TokenNotifier tokenNotifier,
    required LocalTokenService localTokenService,
    required UserSessionService userSessionService,
    required AuthRepository authRepository,
  })  : _localTokenService = localTokenService,
        _tokenNotifier = tokenNotifier,
        _userSessionService = userSessionService,
        _authRepo = authRepository,
        super(
          session != null
              ? AuthState.loggedIn(session: session)
              : const AuthState.unknown(),
        );

  String? get token => _tokenNotifier.value;
  AuthState get value => state;
  Session? get session => _userSessionService.session;

  Future<void> init() async {
    if (state != const AuthState.unknown()) return;
    if (_tokenNotifier.value != null) {
      await _localTokenService.reset(_tokenNotifier.value);
      return;
    }

    final token = await _localTokenService.token;
    final validToken = token != null && !JwtDecoder.isExpired(token);
    if (validToken) {
      _tokenNotifier.reset(token);

      final decodedToken = JwtDecoder.decode(token);
      var userSession = _userSessionService.session;

      if (userSession == null) {
        final contato = await _authRepo.getMyContato();

        if (contato.sucesso) {
          userSession = Session(
            contato: contato.dados!,
            logInDate: JwtHelper.iatToDateTime(decodedToken['iat']),
            expiresIn: JwtHelper.expToDateTime(decodedToken['exp']),
          );

          await _userSessionService.save(userSession);
        } else {
          state = AuthState.error(error: contato.erro);
          return;
        }
      }

      state = AuthState.loggedIn(session: userSession);

      return;
    }

    state = const AuthState.loggedOut();
  }

  Future<void> logout() async {
    await Future.wait([
      _localTokenService.reset(null),
      _userSessionService.delete(),
    ]);
    _tokenNotifier.reset(null);
    state = const AuthState.loggedOut();
    return;
  }

  Future<void> login(Account account) async {
    state = const AuthState.loggingIn();
    try {
      final response = await _authRepo.login(account);

      if (response.sucesso) {
        final authResponse = response.dados!;

        await _localTokenService.reset(authResponse.accessToken);
        _tokenNotifier.reset(authResponse.accessToken);

        final decodedToken = JwtDecoder.decode(authResponse.accessToken);

        final session = Session(
          contato: authResponse.contato,
          logInDate: JwtHelper.iatToDateTime(decodedToken['iat']),
          expiresIn: JwtHelper.expToDateTime(decodedToken['exp']),
        );

        await _userSessionService.save(session);
        state = AuthState.loggedIn(session: session);
        return;
      } else {
        state = AuthState.error(
            error: {'mensagem': response.mensagem, 'erro': response.erro});
      }
    } catch (e) {
      state = AuthState.error(error: e);
    }
  }

  Future<void> resetContatoSession(Contato contato) async {
    if (session != null) {
      await _userSessionService.save(session!.copyWith(contato: contato));
    }

    return;
  }
}
