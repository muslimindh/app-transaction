part of '../views.dart';

class Utility {
  static final instance = Utility._();
  factory Utility() => instance;

  Utility._();
  final moneyFormat =
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ');

  Future<bool> checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return (connectivityResult.contains(ConnectivityResult.none))
        ? false
        : true;
  }
}
