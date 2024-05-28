part of '../views.dart';

class Utility {
  static final instance = Utility._();
  factory Utility() => instance;

  Utility._();
  final moneyFormat =
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ');
}
