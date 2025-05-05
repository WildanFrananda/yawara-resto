// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  id: json['id'] as String,
  user: json['user'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: json['type'] as String,
  status: json['status'] as String,
  notes: json['notes'] as String,
  retryCount: (json['retryCount'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'amount': instance.amount,
      'type': instance.type,
      'status': instance.status,
      'notes': instance.notes,
      'retryCount': instance.retryCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
