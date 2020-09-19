import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/utils/graphql/exceptions.dart';
import 'package:meta/meta.dart' show required;
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:getXAuth/app/utils/graphql/queries/authentication/queries.dart'
    as queries;

String get host {
  if (GetPlatform.isAndroid) {
    return '10.0.2.2';
  }
  return 'localhost';
}

final graphqlEndpoint = 'http://$host:3000/query';

class AuthenticationApiClient {
  // final GraphQLClient _client;
  GraphQLClient _client() {
    final HttpLink _httpLink = HttpLink(graphqlEndpoint);

    // final AuthLink _authLink = AuthLink(
    //   getToken: () => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    // );

    // final Link _link = _authLink.concat(_httpLink);
    final Link _link = _httpLink;
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: _link,
    );
  }

  Future<Credentials> requestNewCredentials({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);
    print("Sending data to backend email: $email");
    print("Sending data to backend password: $password");
    final MutationOptions options = MutationOptions(
        document: gql(queries.userLogin),
        fetchPolicy: FetchPolicy.noCache,
        variables: <String, String>{'email': email, 'password': password});

    final QueryResult res = await _client().mutate(options);
    if (res.hasException) {
      throw new GraphQLException(res.exception.graphqlErrors.first);
    }
    return Credentials.fromJson(res.data);
  }

  // VerifyUserCredentials
  Future<bool> verifyUserCredentials(Credentials data) async {
    assert(data != null);
    final QueryOptions options = QueryOptions(
        document: gql(queries.verifyToken),
        fetchPolicy: FetchPolicy.noCache,
        variables: <String, String>{'token': data.credentials.token});
    print("Run query");
    final QueryResult res = await _client().query(options);
    print("verifyUserCredentials res $res");
    return false;
  }
}
