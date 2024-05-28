part of '../viewmodels.dart';

String baseURL = 'https://test-muslimin.bintangmfhd.com';

final createTransactionProvider =
    FutureProvider.family<void, DataTransaction>((ref, transactionData) async {
  try {
    final response = await http.post(
      Uri.parse('$baseURL/transactions/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'amount': transactionData.amount,
        'type': transactionData.type,
        'note': transactionData.category,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Terjadi kesalahan server [${response.statusCode}]');
    }
  } catch (e) {
    throw Exception('Terjadi kesalahan server');
  }
});

final listDatatransactionProvider =
    FutureProvider<List<DataTransaction>>((ref) async {
  try {
    final response = await http.get(Uri.parse('$baseURL/transactions/all'));
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        final List<dynamic> transactionsJson = responseBody['data'];
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
      throw Exception('Terjadi kesalahan server [${response.statusCode}]');
    }
  } catch (e) {
    throw Exception('Terjadi kesalahan server');
  }
});
