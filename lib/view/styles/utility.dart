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

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
