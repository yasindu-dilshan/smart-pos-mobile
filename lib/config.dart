class Config {
  // ignore: constant_identifier_names
  static const String BACKEND_URL = String.fromEnvironment('BACKEND_URL',
      defaultValue: 'https://smart-pos-backend.herokuapp.com/api/');
}
