// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContatoModel _$ContatoModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ContatoModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'uid',
            'nome',
            'ativo',
            'account',
            'criadoEm',
            'atualizadoEm',
            'telefones',
            'categorias'
          ],
        );
        final val = ContatoModel(
          uid: $checkedConvert('uid', (v) => v as String?),
          nome: $checkedConvert('nome', (v) => v as String),
          telefones: $checkedConvert(
              'telefones', (v) => (v as List<dynamic>).map((e) => e as String)),
          categorias: $checkedConvert(
              'categorias',
              (v) => (v as List<dynamic>)
                  .map((e) => $enumDecode(_$RolesEnumEnumMap, e))),
          criadoEm: $checkedConvert('criadoEm',
              (v) => v == null ? null : DateTime.parse(v as String)),
          atualizadoEm: $checkedConvert('atualizadoEm',
              (v) => v == null ? null : DateTime.parse(v as String)),
          ativo: $checkedConvert('ativo', (v) => v as bool?),
          account: $checkedConvert(
              'account',
              (v) => v == null
                  ? null
                  : AccountModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ContatoModelToJson(ContatoModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  val['nome'] = instance.nome;
  writeNotNull('ativo', instance.ativo);
  writeNotNull('account', instance.account);
  writeNotNull('criadoEm', instance.criadoEm?.toIso8601String());
  writeNotNull('atualizadoEm', instance.atualizadoEm?.toIso8601String());
  val['telefones'] = instance.telefones.toList();
  val['categorias'] =
      instance.categorias.map((e) => _$RolesEnumEnumMap[e]!).toList();
  return val;
}

const _$RolesEnumEnumMap = {
  RolesEnum.admin: 'ADMIN',
  RolesEnum.gerente: 'GERENTE',
  RolesEnum.colaborador: 'COLABORADOR',
  RolesEnum.dentista: 'DENTISTA',
  RolesEnum.paciente: 'PACIENTE',
  RolesEnum.entregador: 'ENTREGADOR',
  RolesEnum.fornecedor: 'FORNECEDOR',
};
