const userLogin = r'''
mutation UserLogin( $email: String!, $password: String! ) {
  credentials(input: { email: $email, password: $password }) {
    token
  }
}
''';
