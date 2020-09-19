import 'package:graphql/client.dart';

class GraphQLException implements Exception {
  GraphQLError response;
  GraphQLException(this.response);
}