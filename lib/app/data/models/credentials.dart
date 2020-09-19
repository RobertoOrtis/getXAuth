import 'package:meta/meta.dart';

class Credentials {
    Credentials({
        @required this.credentials,
    });

    final CredentialsData credentials;

    factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        credentials: CredentialsData.fromJson(json["credentials"]),
    );

    Map<String, dynamic> toJson() => {
        "credentials": credentials.toJson(),
    };
}

class CredentialsData {
    CredentialsData({
        @required this.token,
        @required this.expiresAt,
    });

    final String token;
    final String expiresAt;

    factory CredentialsData.fromJson(Map<String, dynamic> json) => CredentialsData(
        token: json["token"],
        expiresAt: json["expiresAt"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiresAt": expiresAt,
    };
}
