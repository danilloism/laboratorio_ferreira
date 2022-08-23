import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/session.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/notifiers/token_notifier.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/repository/auth_repository.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/services/local_token_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/services/user_session_service.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/state/auth_state.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LocalTokenService _localTokenService;
  final TokenNotifier _tokenNotifier;
  final UserSessionService _userSession;
  final AuthRepository _authRepo;
  AuthNotifier({
    Session? user,
    required TokenNotifier tokenNotifier,
    required LocalTokenService localTokenService,
    required UserSessionService userSession,
    required AuthRepository authRepository,
  })  : _localTokenService = localTokenService,
        _tokenNotifier = tokenNotifier,
        _userSession = userSession,
        _authRepo = authRepository,
        super(
          user != null
              ? AuthState.loggedIn(user: user)
              : const AuthState.unknown(),
        );

  String? get token => _tokenNotifier.value;
  AuthState get value => state;
  Session? get user => _userSession.user;

  Future<void> init() async {
    if (state != const AuthState.unknown()) return;
    if (_tokenNotifier.value != null) {
      await _localTokenService.reset(_tokenNotifier.value);
      return;
    }

    final token = await _localTokenService.token;
    final validToken = token != null && !JwtDecoder.isExpired(token);
    if (validToken) {
      final decodedToken = JwtDecoder.decode(token);

      var user = _userSession.user;

      if (user == null) {
        final account = Account(
          email: decodedToken['email'],
          contatoUid: decodedToken['sub'],
        );

        final roles = List<String>.from(decodedToken['roles'])
            .map((role) => RolesEnum.values.byName(role.toLowerCase()))
            .toList();

        user = Session(
            account: account,
            roles: roles,
            expiresIn: JwtDecoder.getExpirationDate(token));

        await _userSession.save(user);
      }

      state = AuthState.loggedIn(user: user);

      return;
    }

    state = const AuthState.loggedOut();
  }

  Future<void> logout() async {
    await Future.wait([
      _localTokenService.reset(null),
      _userSession.delete(),
    ]);
    _tokenNotifier.reset(null);

    return;
  }

  Future<void> login(Account account) async {
    try {
      final response = await _authRepo.login(account);

      if (response.sucesso) {
        await _localTokenService.reset(response.dados!.accessToken);
        _tokenNotifier.reset(response.dados!.accessToken);
        final decodedToken = JwtDecoder.decode(response.dados!.accessToken);
        account = Account(
            email: decodedToken['email'],
            contatoUid: decodedToken['contatoUid']);

        await _userSession.save(Session(
            account: account,
            roles: decodedToken['roles'],
            expiresIn:
                JwtDecoder.getExpirationDate(response.dados!.accessToken)));

        return;
      } else {
        state = AuthState.error(
            error: {'mensagem': response.mensagem, 'erro': response.erros});
      }
    } catch (e) {
      state = AuthState.error(error: e);
    }
  }
}
