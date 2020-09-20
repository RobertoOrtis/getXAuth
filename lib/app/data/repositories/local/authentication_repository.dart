import 'package:meta/meta.dart';
import 'package:getXAuth/app/data/interfaces/local/local_authentication_interface.dart';
import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/data/providers/local/authentication_provider.dart';

class LocalAuthenticationRepository implements LocalAuthenticationInterface {
  final LocalAuthenticationProvider _authenticationProvider;

  LocalAuthenticationRepository(
      {@required LocalAuthenticationProvider authenticationProvider})
      : assert(authenticationProvider != null),
        _authenticationProvider = authenticationProvider;

  @override
  Future<Credentials> getSession() async {
    return await _authenticationProvider.session;
  }

  @override
  void setSession(Credentials credentials) {
    _authenticationProvider.setSession(credentials);
  }

  @override
  void clearSession() {
    _authenticationProvider.clearSession();
  }
}
