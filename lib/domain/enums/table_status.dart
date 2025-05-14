enum TableStatus {
  available(unit: 'available'),
  reserved(unit: 'reserved');

  final String unit;

  const TableStatus({required this.unit});
}
