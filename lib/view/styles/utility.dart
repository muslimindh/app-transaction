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

  String diffDate({required DateTime date}) {
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);

    if (difference.inMinutes <= 1) {
      return '1 menit yang lalu';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inHours <= 1) {
      return '1 jam yang lalu';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inDays <= 1) {
      return '1 hari yang lalu';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} hari yang lalu';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return '1 minggu yang lalu';
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} minggu yang lalu';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return '1 bulan yang lalu';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} bulan yang lalu';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return '1 tahun yang lalu';
    }
    return '${(difference.inDays / 365).floor()} years ago';
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
