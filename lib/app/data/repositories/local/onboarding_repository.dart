import 'package:flutter/foundation.dart';
import 'package:getXAuth/app/data/interfaces/local/onboarding_interface.dart';
import 'package:getXAuth/app/data/providers/local/onboarding_provider.dart';

class OnboardingRepository extends OnboardingInterface {
  final OnboardingProvider _onboardingProvider;

  OnboardingRepository({@required OnboardingProvider onboardingProvider})
    : assert(onboardingProvider != null),
    _onboardingProvider = onboardingProvider;

  @override
  void setStatus(status) {
    _onboardingProvider.setStatus(status);
  }
  
  @override
  Future<String> getStatus() async {
    return await _onboardingProvider.status;
  }
}