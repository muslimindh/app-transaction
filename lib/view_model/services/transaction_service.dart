part of '../viewmodels.dart';

BaseNetwork net = BaseNetwork();

final createTransactionProvider =
    FutureProvider.family<AsyncValue<void>, Map<String, dynamic>>(
        (ref, transactionData) async {
  try {
    var form = FormData.fromMap(transactionData);
    final Response resp = await net.request(
      '/transactions/create',
      requestMethod: 'post',
      data: form,
      queryParameter: {'_method': 'post'},
    );
    if (resp.statusCode == 200) {
      return const AsyncData<void>(null);
    } else {
      throw Exception('Terjadi kesalahan server [${resp.statusCode}]');
    }
  } catch (e) {
    debugPrint('$e');
    throw Exception('Terjadi kesalahan server');
  }
});

final listDatatransactionProvider =
    FutureProvider<List<DataTransaction>>((ref) async {
  try {
    final Response resp = await net.request('/transactions/all');
    if (resp.statusCode == 200) {
      if (resp.data['success']) {
        final List<dynamic> transactionsJson = resp.data['data'];
        if (transactionsJson.isEmpty) {
          return [];
        } else {
          return transactionsJson
              .map((json) => DataTransaction.fromJson(json))
              .toList()
              .reversed
              .toList();
        }
      } else {
        return [];
      }
    } else {
      throw Exception('Terjadi kesalahan server [${resp.statusCode}]');
    }
  } catch (e) {
    throw Exception('Terjadi kesalahan server');
  }
});

final deleteTransactionProvider =
    FutureProvider.family<AsyncValue<void>, int>((ref, transactionData) async {
  try {
    final Response resp = await net.request(
      '/transactions/delete/$transactionData',
      requestMethod: 'delete',
    );
    if (resp.statusCode == 200) {
      return const AsyncData<void>(null);
    } else {
      throw Exception('Terjadi kesalahan server [${resp.statusCode}]');
    }
  } catch (e) {
    debugPrint('$e');
    throw Exception('Terjadi kesalahan server');
  }
});
