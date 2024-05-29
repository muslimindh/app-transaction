import 'package:intl/intl.dart';

class DataTransaction {
  final int? amount;
  final String? type;
  final String? category;
  final String? createdAt;
  final int? id;

  DataTransaction({
    this.amount,
    this.type,
    this.category,
    this.createdAt,
    this.id,
  });

  factory DataTransaction.fromJson(Map<String, dynamic> json) =>
      DataTransaction(
        amount: json["amount"],
        type: json["type"],
        category: json["category"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  String parseDate() {
    DateTime parseDate = DateFormat("dd-MM-yyyy, HH:mm:ss").parse(createdAt!);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM yyyy - HH:mm', 'in');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
