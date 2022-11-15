class RefreshToken {
  const RefreshToken(this.accessToken);

  final String accessToken;

  factory RefreshToken.fromJson(Object? json) {
    return RefreshToken((json as Map<String, dynamic>)['accessToken']);
  }
}

//TODO
