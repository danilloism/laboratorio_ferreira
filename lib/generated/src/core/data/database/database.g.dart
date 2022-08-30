// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/core/data/database/database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Contato extends DataClass implements Insertable<Contato> {
  final String uid;
  final String nome;
  final bool? ativo;
  final DateTime? criadoEm;
  final DateTime? atualizadoEm;
  final Set<Roles>? categorias;
  final Set<String>? telefones;
  const Contato(
      {required this.uid,
      required this.nome,
      this.ativo,
      this.criadoEm,
      this.atualizadoEm,
      this.categorias,
      this.telefones});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['nome'] = Variable<String>(nome);
    if (!nullToAbsent || ativo != null) {
      final converter = Contatos.$converter0;
      map['ativo'] = Variable<int>(converter.toSql(ativo));
    }
    if (!nullToAbsent || criadoEm != null) {
      final converter = Contatos.$converter1n;
      map['criado_em'] = Variable<String>(converter.toSql(criadoEm));
    }
    if (!nullToAbsent || atualizadoEm != null) {
      final converter = Contatos.$converter2n;
      map['atualizado_em'] = Variable<String>(converter.toSql(atualizadoEm));
    }
    if (!nullToAbsent || categorias != null) {
      final converter = Contatos.$converter3n;
      map['categorias'] = Variable<String>(converter.toSql(categorias));
    }
    if (!nullToAbsent || telefones != null) {
      final converter = Contatos.$converter4n;
      map['telefones'] = Variable<String>(converter.toSql(telefones));
    }
    return map;
  }

  ContatosCompanion toCompanion(bool nullToAbsent) {
    return ContatosCompanion(
      uid: Value(uid),
      nome: Value(nome),
      ativo:
          ativo == null && nullToAbsent ? const Value.absent() : Value(ativo),
      criadoEm: criadoEm == null && nullToAbsent
          ? const Value.absent()
          : Value(criadoEm),
      atualizadoEm: atualizadoEm == null && nullToAbsent
          ? const Value.absent()
          : Value(atualizadoEm),
      categorias: categorias == null && nullToAbsent
          ? const Value.absent()
          : Value(categorias),
      telefones: telefones == null && nullToAbsent
          ? const Value.absent()
          : Value(telefones),
    );
  }

  factory Contato.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Contato(
      uid: serializer.fromJson<String>(json['uid']),
      nome: serializer.fromJson<String>(json['nome']),
      ativo: serializer.fromJson<bool?>(json['ativo']),
      criadoEm: serializer.fromJson<DateTime?>(json['criado_em']),
      atualizadoEm: serializer.fromJson<DateTime?>(json['atualizado_em']),
      categorias: serializer.fromJson<Set<Roles>?>(json['categorias']),
      telefones: serializer.fromJson<Set<String>?>(json['telefones']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'nome': serializer.toJson<String>(nome),
      'ativo': serializer.toJson<bool?>(ativo),
      'criado_em': serializer.toJson<DateTime?>(criadoEm),
      'atualizado_em': serializer.toJson<DateTime?>(atualizadoEm),
      'categorias': serializer.toJson<Set<Roles>?>(categorias),
      'telefones': serializer.toJson<Set<String>?>(telefones),
    };
  }

  Contato copyWith(
          {String? uid,
          String? nome,
          Value<bool?> ativo = const Value.absent(),
          Value<DateTime?> criadoEm = const Value.absent(),
          Value<DateTime?> atualizadoEm = const Value.absent(),
          Value<Set<Roles>?> categorias = const Value.absent(),
          Value<Set<String>?> telefones = const Value.absent()}) =>
      Contato(
        uid: uid ?? this.uid,
        nome: nome ?? this.nome,
        ativo: ativo.present ? ativo.value : this.ativo,
        criadoEm: criadoEm.present ? criadoEm.value : this.criadoEm,
        atualizadoEm:
            atualizadoEm.present ? atualizadoEm.value : this.atualizadoEm,
        categorias: categorias.present ? categorias.value : this.categorias,
        telefones: telefones.present ? telefones.value : this.telefones,
      );
  @override
  String toString() {
    return (StringBuffer('Contato(')
          ..write('uid: $uid, ')
          ..write('nome: $nome, ')
          ..write('ativo: $ativo, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('categorias: $categorias, ')
          ..write('telefones: $telefones')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uid, nome, ativo, criadoEm, atualizadoEm, categorias, telefones);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contato &&
          other.uid == this.uid &&
          other.nome == this.nome &&
          other.ativo == this.ativo &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.categorias == this.categorias &&
          other.telefones == this.telefones);
}

class ContatosCompanion extends UpdateCompanion<Contato> {
  final Value<String> uid;
  final Value<String> nome;
  final Value<bool?> ativo;
  final Value<DateTime?> criadoEm;
  final Value<DateTime?> atualizadoEm;
  final Value<Set<Roles>?> categorias;
  final Value<Set<String>?> telefones;
  const ContatosCompanion({
    this.uid = const Value.absent(),
    this.nome = const Value.absent(),
    this.ativo = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.categorias = const Value.absent(),
    this.telefones = const Value.absent(),
  });
  ContatosCompanion.insert({
    required String uid,
    required String nome,
    this.ativo = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.categorias = const Value.absent(),
    this.telefones = const Value.absent(),
  })  : uid = Value(uid),
        nome = Value(nome);
  static Insertable<Contato> custom({
    Expression<String>? uid,
    Expression<String>? nome,
    Expression<int>? ativo,
    Expression<String>? criadoEm,
    Expression<String>? atualizadoEm,
    Expression<String>? categorias,
    Expression<String>? telefones,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (nome != null) 'nome': nome,
      if (ativo != null) 'ativo': ativo,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (categorias != null) 'categorias': categorias,
      if (telefones != null) 'telefones': telefones,
    });
  }

  ContatosCompanion copyWith(
      {Value<String>? uid,
      Value<String>? nome,
      Value<bool?>? ativo,
      Value<DateTime?>? criadoEm,
      Value<DateTime?>? atualizadoEm,
      Value<Set<Roles>?>? categorias,
      Value<Set<String>?>? telefones}) {
    return ContatosCompanion(
      uid: uid ?? this.uid,
      nome: nome ?? this.nome,
      ativo: ativo ?? this.ativo,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      categorias: categorias ?? this.categorias,
      telefones: telefones ?? this.telefones,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (ativo.present) {
      final converter = Contatos.$converter0;
      map['ativo'] = Variable<int>(converter.toSql(ativo.value));
    }
    if (criadoEm.present) {
      final converter = Contatos.$converter1n;
      map['criado_em'] = Variable<String>(converter.toSql(criadoEm.value));
    }
    if (atualizadoEm.present) {
      final converter = Contatos.$converter2n;
      map['atualizado_em'] =
          Variable<String>(converter.toSql(atualizadoEm.value));
    }
    if (categorias.present) {
      final converter = Contatos.$converter3n;
      map['categorias'] = Variable<String>(converter.toSql(categorias.value));
    }
    if (telefones.present) {
      final converter = Contatos.$converter4n;
      map['telefones'] = Variable<String>(converter.toSql(telefones.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContatosCompanion(')
          ..write('uid: $uid, ')
          ..write('nome: $nome, ')
          ..write('ativo: $ativo, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('categorias: $categorias, ')
          ..write('telefones: $telefones')
          ..write(')'))
        .toString();
  }
}

class Contatos extends Table with TableInfo<Contatos, Contato> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Contatos(this.attachedDatabase, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _ativoMeta = const VerificationMeta('ativo');
  late final GeneratedColumnWithTypeConverter<bool?, int> ativo =
      GeneratedColumn<int>('ativo', aliasedName, true,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              $customConstraints: 'NULL')
          .withConverter<bool?>(Contatos.$converter0);
  final VerificationMeta _criadoEmMeta = const VerificationMeta('criadoEm');
  late final GeneratedColumnWithTypeConverter<DateTime?, String> criadoEm =
      GeneratedColumn<String>('criado_em', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<DateTime?>(Contatos.$converter1n);
  final VerificationMeta _atualizadoEmMeta =
      const VerificationMeta('atualizadoEm');
  late final GeneratedColumnWithTypeConverter<DateTime?, String> atualizadoEm =
      GeneratedColumn<String>('atualizado_em', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<DateTime?>(Contatos.$converter2n);
  final VerificationMeta _categoriasMeta = const VerificationMeta('categorias');
  late final GeneratedColumnWithTypeConverter<Set<Roles>?, String> categorias =
      GeneratedColumn<String>('categorias', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<Set<Roles>?>(Contatos.$converter3n);
  final VerificationMeta _telefonesMeta = const VerificationMeta('telefones');
  late final GeneratedColumnWithTypeConverter<Set<String>?, String> telefones =
      GeneratedColumn<String>('telefones', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<Set<String>?>(Contatos.$converter4n);
  @override
  List<GeneratedColumn> get $columns =>
      [uid, nome, ativo, criadoEm, atualizadoEm, categorias, telefones];
  @override
  String get aliasedName => _alias ?? 'contatos';
  @override
  String get actualTableName => 'contatos';
  @override
  VerificationContext validateIntegrity(Insertable<Contato> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    context.handle(_ativoMeta, const VerificationResult.success());
    context.handle(_criadoEmMeta, const VerificationResult.success());
    context.handle(_atualizadoEmMeta, const VerificationResult.success());
    context.handle(_categoriasMeta, const VerificationResult.success());
    context.handle(_telefonesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  Contato map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Contato(
      uid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      nome: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      ativo: Contatos.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}ativo'])),
      criadoEm: Contatos.$converter1n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}criado_em'])),
      atualizadoEm: Contatos.$converter2n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}atualizado_em'])),
      categorias: Contatos.$converter3n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}categorias'])),
      telefones: Contatos.$converter4n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}telefones'])),
    );
  }

  @override
  Contatos createAlias(String alias) {
    return Contatos(attachedDatabase, alias);
  }

  static TypeConverter<bool?, int?> $converter0 = const NullableBoolConverter();
  static TypeConverter<DateTime, String> $converter1 =
      const DateTimeConverter();
  static TypeConverter<DateTime, String> $converter2 =
      const DateTimeConverter();
  static TypeConverter<Set<Roles>, String> $converter3 =
      const CategoriasConverter();
  static TypeConverter<Set<String>, String> $converter4 =
      const TelefonesConverter();
  static TypeConverter<DateTime?, String?> $converter1n =
      NullAwareTypeConverter.wrap($converter1);
  static TypeConverter<DateTime?, String?> $converter2n =
      NullAwareTypeConverter.wrap($converter2);
  static TypeConverter<Set<Roles>?, String?> $converter3n =
      NullAwareTypeConverter.wrap($converter3);
  static TypeConverter<Set<String>?, String?> $converter4n =
      NullAwareTypeConverter.wrap($converter4);
  @override
  bool get dontWriteConstraints => true;
}

class Account extends DataClass implements Insertable<Account> {
  final String email;
  final DateTime? criadoEm;
  final DateTime? atualizadoEm;
  final String contatoUid;
  const Account(
      {required this.email,
      this.criadoEm,
      this.atualizadoEm,
      required this.contatoUid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || criadoEm != null) {
      final converter = Accounts.$converter0n;
      map['criado_em'] = Variable<String>(converter.toSql(criadoEm));
    }
    if (!nullToAbsent || atualizadoEm != null) {
      final converter = Accounts.$converter1n;
      map['atualizado_em'] = Variable<String>(converter.toSql(atualizadoEm));
    }
    map['contato_uid'] = Variable<String>(contatoUid);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      email: Value(email),
      criadoEm: criadoEm == null && nullToAbsent
          ? const Value.absent()
          : Value(criadoEm),
      atualizadoEm: atualizadoEm == null && nullToAbsent
          ? const Value.absent()
          : Value(atualizadoEm),
      contatoUid: Value(contatoUid),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      email: serializer.fromJson<String>(json['email']),
      criadoEm: serializer.fromJson<DateTime?>(json['criado_em']),
      atualizadoEm: serializer.fromJson<DateTime?>(json['atualizado_em']),
      contatoUid: serializer.fromJson<String>(json['contato_uid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'criado_em': serializer.toJson<DateTime?>(criadoEm),
      'atualizado_em': serializer.toJson<DateTime?>(atualizadoEm),
      'contato_uid': serializer.toJson<String>(contatoUid),
    };
  }

  Account copyWith(
          {String? email,
          Value<DateTime?> criadoEm = const Value.absent(),
          Value<DateTime?> atualizadoEm = const Value.absent(),
          String? contatoUid}) =>
      Account(
        email: email ?? this.email,
        criadoEm: criadoEm.present ? criadoEm.value : this.criadoEm,
        atualizadoEm:
            atualizadoEm.present ? atualizadoEm.value : this.atualizadoEm,
        contatoUid: contatoUid ?? this.contatoUid,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('email: $email, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('contatoUid: $contatoUid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(email, criadoEm, atualizadoEm, contatoUid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.email == this.email &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.contatoUid == this.contatoUid);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> email;
  final Value<DateTime?> criadoEm;
  final Value<DateTime?> atualizadoEm;
  final Value<String> contatoUid;
  const AccountsCompanion({
    this.email = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.contatoUid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String email,
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    required String contatoUid,
  })  : email = Value(email),
        contatoUid = Value(contatoUid);
  static Insertable<Account> custom({
    Expression<String>? email,
    Expression<String>? criadoEm,
    Expression<String>? atualizadoEm,
    Expression<String>? contatoUid,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (contatoUid != null) 'contato_uid': contatoUid,
    });
  }

  AccountsCompanion copyWith(
      {Value<String>? email,
      Value<DateTime?>? criadoEm,
      Value<DateTime?>? atualizadoEm,
      Value<String>? contatoUid}) {
    return AccountsCompanion(
      email: email ?? this.email,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      contatoUid: contatoUid ?? this.contatoUid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (criadoEm.present) {
      final converter = Accounts.$converter0n;
      map['criado_em'] = Variable<String>(converter.toSql(criadoEm.value));
    }
    if (atualizadoEm.present) {
      final converter = Accounts.$converter1n;
      map['atualizado_em'] =
          Variable<String>(converter.toSql(atualizadoEm.value));
    }
    if (contatoUid.present) {
      map['contato_uid'] = Variable<String>(contatoUid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('email: $email, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('contatoUid: $contatoUid')
          ..write(')'))
        .toString();
  }
}

class Accounts extends Table with TableInfo<Accounts, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Accounts(this.attachedDatabase, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _criadoEmMeta = const VerificationMeta('criadoEm');
  late final GeneratedColumnWithTypeConverter<DateTime?, String> criadoEm =
      GeneratedColumn<String>('criado_em', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<DateTime?>(Accounts.$converter0n);
  final VerificationMeta _atualizadoEmMeta =
      const VerificationMeta('atualizadoEm');
  late final GeneratedColumnWithTypeConverter<DateTime?, String> atualizadoEm =
      GeneratedColumn<String>('atualizado_em', aliasedName, true,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<DateTime?>(Accounts.$converter1n);
  final VerificationMeta _contatoUidMeta = const VerificationMeta('contatoUid');
  late final GeneratedColumn<String> contatoUid = GeneratedColumn<String>(
      'contato_uid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE REFERENCES contatos(uid)');
  @override
  List<GeneratedColumn> get $columns =>
      [email, criadoEm, atualizadoEm, contatoUid];
  @override
  String get aliasedName => _alias ?? 'accounts';
  @override
  String get actualTableName => 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    context.handle(_criadoEmMeta, const VerificationResult.success());
    context.handle(_atualizadoEmMeta, const VerificationResult.success());
    if (data.containsKey('contato_uid')) {
      context.handle(
          _contatoUidMeta,
          contatoUid.isAcceptableOrUnknown(
              data['contato_uid']!, _contatoUidMeta));
    } else if (isInserting) {
      context.missing(_contatoUidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      email: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      criadoEm: Accounts.$converter0n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}criado_em'])),
      atualizadoEm: Accounts.$converter1n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}atualizado_em'])),
      contatoUid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}contato_uid'])!,
    );
  }

  @override
  Accounts createAlias(String alias) {
    return Accounts(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converter0 =
      const DateTimeConverter();
  static TypeConverter<DateTime, String> $converter1 =
      const DateTimeConverter();
  static TypeConverter<DateTime?, String?> $converter0n =
      NullAwareTypeConverter.wrap($converter0);
  static TypeConverter<DateTime?, String?> $converter1n =
      NullAwareTypeConverter.wrap($converter1);
  @override
  bool get dontWriteConstraints => true;
}

class Session extends DataClass implements Insertable<Session> {
  final String accessToken;
  final String contatoUid;
  final bool active;
  const Session(
      {required this.accessToken,
      required this.contatoUid,
      required this.active});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['access_token'] = Variable<String>(accessToken);
    map['contato_uid'] = Variable<String>(contatoUid);
    {
      final converter = Sessions.$converter0;
      map['active'] = Variable<int>(converter.toSql(active));
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      accessToken: Value(accessToken),
      contatoUid: Value(contatoUid),
      active: Value(active),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      accessToken: serializer.fromJson<String>(json['access_token']),
      contatoUid: serializer.fromJson<String>(json['contato_uid']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'access_token': serializer.toJson<String>(accessToken),
      'contato_uid': serializer.toJson<String>(contatoUid),
      'active': serializer.toJson<bool>(active),
    };
  }

  Session copyWith({String? accessToken, String? contatoUid, bool? active}) =>
      Session(
        accessToken: accessToken ?? this.accessToken,
        contatoUid: contatoUid ?? this.contatoUid,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('accessToken: $accessToken, ')
          ..write('contatoUid: $contatoUid, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accessToken, contatoUid, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.accessToken == this.accessToken &&
          other.contatoUid == this.contatoUid &&
          other.active == this.active);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<String> accessToken;
  final Value<String> contatoUid;
  final Value<bool> active;
  const SessionsCompanion({
    this.accessToken = const Value.absent(),
    this.contatoUid = const Value.absent(),
    this.active = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String accessToken,
    required String contatoUid,
    required bool active,
  })  : accessToken = Value(accessToken),
        contatoUid = Value(contatoUid),
        active = Value(active);
  static Insertable<Session> custom({
    Expression<String>? accessToken,
    Expression<String>? contatoUid,
    Expression<int>? active,
  }) {
    return RawValuesInsertable({
      if (accessToken != null) 'access_token': accessToken,
      if (contatoUid != null) 'contato_uid': contatoUid,
      if (active != null) 'active': active,
    });
  }

  SessionsCompanion copyWith(
      {Value<String>? accessToken,
      Value<String>? contatoUid,
      Value<bool>? active}) {
    return SessionsCompanion(
      accessToken: accessToken ?? this.accessToken,
      contatoUid: contatoUid ?? this.contatoUid,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (contatoUid.present) {
      map['contato_uid'] = Variable<String>(contatoUid.value);
    }
    if (active.present) {
      final converter = Sessions.$converter0;
      map['active'] = Variable<int>(converter.toSql(active.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('accessToken: $accessToken, ')
          ..write('contatoUid: $contatoUid, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class Sessions extends Table with TableInfo<Sessions, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Sessions(this.attachedDatabase, [this._alias]);
  final VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
      'access_token', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _contatoUidMeta = const VerificationMeta('contatoUid');
  late final GeneratedColumn<String> contatoUid = GeneratedColumn<String>(
      'contato_uid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES contatos(uid)');
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  late final GeneratedColumnWithTypeConverter<bool, int> active =
      GeneratedColumn<int>('active', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<bool>(Sessions.$converter0);
  @override
  List<GeneratedColumn> get $columns => [accessToken, contatoUid, active];
  @override
  String get aliasedName => _alias ?? 'sessions';
  @override
  String get actualTableName => 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('access_token')) {
      context.handle(
          _accessTokenMeta,
          accessToken.isAcceptableOrUnknown(
              data['access_token']!, _accessTokenMeta));
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    if (data.containsKey('contato_uid')) {
      context.handle(
          _contatoUidMeta,
          contatoUid.isAcceptableOrUnknown(
              data['contato_uid']!, _contatoUidMeta));
    } else if (isInserting) {
      context.missing(_contatoUidMeta);
    }
    context.handle(_activeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accessToken, contatoUid, active};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      accessToken: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}access_token'])!,
      contatoUid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}contato_uid'])!,
      active: Sessions.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}active'])!),
    );
  }

  @override
  Sessions createAlias(String alias) {
    return Sessions(attachedDatabase, alias);
  }

  static TypeConverter<bool, int> $converter0 = const BoolConverter();
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT COMPOSITE_KEY PRIMARY KEY (access_token, contato_uid, active)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Setting extends DataClass implements Insertable<Setting> {
  final ThemeMode themeMode;
  final String? sessionAccessToken;
  const Setting({required this.themeMode, this.sessionAccessToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      final converter = Settings.$converter0;
      map['theme_mode'] = Variable<int>(converter.toSql(themeMode));
    }
    if (!nullToAbsent || sessionAccessToken != null) {
      map['session_access_token'] = Variable<String>(sessionAccessToken);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      themeMode: Value(themeMode),
      sessionAccessToken: sessionAccessToken == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionAccessToken),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      themeMode: serializer.fromJson<ThemeMode>(json['theme_mode']),
      sessionAccessToken:
          serializer.fromJson<String?>(json['session_access_token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'theme_mode': serializer.toJson<ThemeMode>(themeMode),
      'session_access_token': serializer.toJson<String?>(sessionAccessToken),
    };
  }

  Setting copyWith(
          {ThemeMode? themeMode,
          Value<String?> sessionAccessToken = const Value.absent()}) =>
      Setting(
        themeMode: themeMode ?? this.themeMode,
        sessionAccessToken: sessionAccessToken.present
            ? sessionAccessToken.value
            : this.sessionAccessToken,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('themeMode: $themeMode, ')
          ..write('sessionAccessToken: $sessionAccessToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(themeMode, sessionAccessToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.themeMode == this.themeMode &&
          other.sessionAccessToken == this.sessionAccessToken);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<ThemeMode> themeMode;
  final Value<String?> sessionAccessToken;
  const SettingsCompanion({
    this.themeMode = const Value.absent(),
    this.sessionAccessToken = const Value.absent(),
  });
  SettingsCompanion.insert({
    required ThemeMode themeMode,
    this.sessionAccessToken = const Value.absent(),
  }) : themeMode = Value(themeMode);
  static Insertable<Setting> custom({
    Expression<int>? themeMode,
    Expression<String>? sessionAccessToken,
  }) {
    return RawValuesInsertable({
      if (themeMode != null) 'theme_mode': themeMode,
      if (sessionAccessToken != null)
        'session_access_token': sessionAccessToken,
    });
  }

  SettingsCompanion copyWith(
      {Value<ThemeMode>? themeMode, Value<String?>? sessionAccessToken}) {
    return SettingsCompanion(
      themeMode: themeMode ?? this.themeMode,
      sessionAccessToken: sessionAccessToken ?? this.sessionAccessToken,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (themeMode.present) {
      final converter = Settings.$converter0;
      map['theme_mode'] = Variable<int>(converter.toSql(themeMode.value));
    }
    if (sessionAccessToken.present) {
      map['session_access_token'] = Variable<String>(sessionAccessToken.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('themeMode: $themeMode, ')
          ..write('sessionAccessToken: $sessionAccessToken')
          ..write(')'))
        .toString();
  }
}

class Settings extends Table with TableInfo<Settings, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  final VerificationMeta _themeModeMeta = const VerificationMeta('themeMode');
  late final GeneratedColumnWithTypeConverter<ThemeMode, int> themeMode =
      GeneratedColumn<int>('theme_mode', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<ThemeMode>(Settings.$converter0);
  final VerificationMeta _sessionAccessTokenMeta =
      const VerificationMeta('sessionAccessToken');
  late final GeneratedColumn<String> sessionAccessToken =
      GeneratedColumn<String>('session_access_token', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: 'REFERENCES sessions(access_token)');
  @override
  List<GeneratedColumn> get $columns => [themeMode, sessionAccessToken];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_themeModeMeta, const VerificationResult.success());
    if (data.containsKey('session_access_token')) {
      context.handle(
          _sessionAccessTokenMeta,
          sessionAccessToken.isAcceptableOrUnknown(
              data['session_access_token']!, _sessionAccessTokenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {themeMode, sessionAccessToken};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      themeMode: Settings.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}theme_mode'])!),
      sessionAccessToken: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}session_access_token']),
    );
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }

  static TypeConverter<ThemeMode, int> $converter0 = const ThemeModeConverter();
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT COMPOSITE_KEY PRIMARY KEY (theme_mode, session_access_token)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final Contatos contatos = Contatos(this);
  late final Accounts accounts = Accounts(this);
  late final Sessions sessions = Sessions(this);
  late final Settings settings = Settings(this);
  late final AccountsDao accountsDao = AccountsDao(this as Database);
  late final ContatosDao contatosDao = ContatosDao(this as Database);
  late final SettingsDao settingsDao = SettingsDao(this as Database);
  late final SessionsDao sessionsDao = SessionsDao(this as Database);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [contatos, accounts, sessions, settings];
}
