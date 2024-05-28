class DataTransaction {
  final String? id;
  final int? amount;
  final DateTime? date;

  DataTransaction({
    this.id,
    this.amount,
    this.date,
  });

  factory DataTransaction.fromJson(Map<String, dynamic> json) =>
      DataTransaction(
        id: json["id"],
        amount: json["amount"],
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
      );
}
