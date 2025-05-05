import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  factory Transaction({
    required final String id,
    required final String user,
    required final double amount,
    required final String type,
    required final String status,
    required final String notes,
    required final int retryCount,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _Transaction;
  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
