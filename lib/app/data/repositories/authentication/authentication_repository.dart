import 'package:get/get.dart';
import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/data/providers/local/authentication.dart';
import 'package:getXAuth/app/data/providers/remote/authentication_client.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository extends GetxController {
  final LocalAuthentication _localAuthentication =
      Get.find<LocalAuthentication>();
  final AuthenticationApiClient _apiClient =
      Get.find<AuthenticationApiClient>();

  AuthenticationStatus _authenticationStatus = AuthenticationStatus.unknown;
  get authenticationStatus => this._authenticationStatus;

  void setAuthenticationStatus(AuthenticationStatus status) {
    switch (status) {
      case AuthenticationStatus.authenticated:
        CredentialsData _credsData =
            CredentialsData(token: "000", expiresAt: "000");
        Credentials _fakeCreds = Credentials(credentials: _credsData);
        _localAuthentication.setSession(_fakeCreds);
        break;
      case AuthenticationStatus.unauthenticated:
        _localAuthentication.clearSession();
        break;
      default:
    }
    _authenticationStatus = status;
  }

  void verifyUserCredentials() async {
    print("Repo is verifying credentials...");
    Credentials credentials = await _localAuthentication.session;
    bool valid = await _apiClient.verifyUserCredentials(credentials);
    if (valid) {
      setAuthenticationStatus(AuthenticationStatus.authenticated);
    } else {
      setAuthenticationStatus(AuthenticationStatus.unauthenticated);
    }
  }
}
