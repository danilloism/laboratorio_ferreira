enum HiveBoxKeys {
  auth('UserInfo');

  final String value;
  const HiveBoxKeys(this.value);
}

enum HiveBoxesConstants {
  session(name: 'SessionBox'),
  encrypted(name: 'EncryptedBox'),
  account(name: 'AccountBox'),
  roles(name: 'RolesBox');

  const HiveBoxesConstants({required this.name});

  final String name;
}
