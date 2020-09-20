import 'package:get/get.dart';
import 'package:getXAuth/app/data/interfaces/local/local_authentication_interface.dart';
import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/data/providers/remote/authentication_client.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationController extends GetxController {
  final LocalAuthenticationInterface _localAuthentication =
      Get.find<LocalAuthenticationInterface>();
  final AuthenticationApiClient _apiClient =
      Get.find<AuthenticationApiClient>();

  var authenticationStatus = AuthenticationStatus.unknown.obs;

  @override
  void onReady() {
    ever(authenticationStatus, (a) {
      final OnboardingStatus _onboardingStatus =
          Get.find<OnboardingController>().onboardingStatus.value;
      final AuthenticationStatus _authenticationStatus =
          authenticationStatus.value;
      if (_authenticationStatus == AuthenticationStatus.authenticated) {
        Get.offAllNamed(AppRoutes.HOME);
      } else if (_authenticationStatus ==
          AuthenticationStatus.unauthenticated) {
        if (_onboardingStatus == OnboardingStatus.unknown) {
          Get.offAllNamed(AppRoutes.ONBOARDING);
        } else {
          Get.offAllNamed(AppRoutes.LOGIN);
        }
      }
      return a;
    });
    super.onReady();
  }

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
        authenticationStatus(AuthenticationStatus.unknown);
    }
    authenticationStatus(status);
  }

  void verifyUserCredentials() async {
    print("Repo is verifying credentials...");
    Credentials credentials = await _localAuthentication.getSession();
    bool valid = await _apiClient.verifyUserCredentials(credentials);
    if (valid) {
      authenticationStatus(AuthenticationStatus.authenticated);
    } else {
      authenticationStatus(AuthenticationStatus.unauthenticated);
    }
  }
}
