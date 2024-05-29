# Aplikasi Pencatatan Transaksi

Aplikasi mobile ini dirancang untuk membantu pengguna dalam mencatat transaksi keuangan seperti pendapatan dan pengeluaran.

## Fitur Utama

- **Pencatatan Pendapatan:** Mudah menambahkan sumber-sumber pendapatan dan melacaknya secara berkala.
- **Pengelolaan Pengeluaran:** Catat setiap pengeluaran dengan rincian yang sederhana serta mudah digunakan.
- **Sinkronisasi Data:** Data disinkronisasikan di seluruh perangkat yang terinstall aplikasi ini.

## Teknologi

<img src="https://github.com/muslimindh/app-transaction/blob/main/assets/images/github/flutter.png" height="100" alt="Flutter" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/muslimindh/app-transaction/blob/main/assets/images/github/laravel.png" height="100" alt="Laravel" />

- **Mobile:** Flutter (version 3.19.3) `state management Riverpod`
- **Backend:** Laravel API (https://github.com/muslimindh/test-muslimin.git)

## Instalasi

Untuk menggunakan aplikasi ini, ikuti langkah-langkah di bawah ini:

```bash
git clone https://github.com/muslimindh/app-transaction.git
cd aplikasi-transaksi
flutter pub get
flutter run
```

# Aplikasi Pencatatan Transaksi

Aplikasi ini memanfaatkan arsitektur Model-View-ViewModel (MVVM) dan Riverpod untuk manajemen state, memudahkan pengelolaan data transaksi secara efisien dan terstruktur.

## Provider: Create Transaction

Provider `createTransactionProvider` menggunakan `FutureProvider.family` untuk memungkinkan pembuatan transaksi yang dinamis berdasarkan data yang dikirimkan. Provider ini bertanggung jawab untuk mengirimkan data transaksi ke server dan mengelola respons. Provider ini mengirim request HTTP POST ke server.

```dart
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
```

## View Model: Create Transaction

`TransactionViewModel` mengextend `StateNotifier`. ViewModel ini mengatur proses pembuatan transaksi, termasuk pemanggilan provider dan pengelolaan respons. ViewModel ini bertanggung jawab untuk mengirimkan data ke `createTransactionProvider` dan menangani hasilnya.

```dart
class TransactionViewModel extends StateNotifier with CustomMixin {
  TransactionViewModel(super.state);

  void createTransaction(
    BuildContext context,
    WidgetRef ref,
    Map<String, dynamic> dataTransaction,
  ) {
    debugPrint('Data being sent: $dataTransaction');
    ref.read(createTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        Get.close(2);
        debugPrint('$state');
        return ref.refresh(listDatatransactionProvider); // Berfungsi untuk update data dari server
      },
      onError: (error) {
        Get.close(1);
        showCustomPopUp(
          context: context,
          title: 'Terjadi kesalahan server',
          color: CustomColor.red,
        );
      },
    );
  }
}
```

## View: Create Transaction

Fungsi ini bertujuan untuk membuat transaksi berdasarkan data yang diberikan oleh pengguna dan memeriksa ketersediaan koneksi internet sebelum melakukan proses.

#### Proses Pemanggilan

```dart
Map<String, dynamic> data = {
  'amount': amount,
  'type': type,
  'category': category,
};
showLoaderOverlay(context: context); // Tampilan loading
final isOnline = await Utility.instance.checkConnection();
if (isOnline) {
  ref.read(transactionProvider.notifier).createTransaction(context, ref, data);
} else {
  Get.close(1);
  showCustomPopUp(
    context: context,
    time: 4,
    title: 'Anda sedang offline. Pastikan terhubung dengan internet',
    color: CustomColor.red,
  );
}
```

## Provider: Delete Transaction

Provider `deleteTransactionProvider` menggunakan `FutureProvider.family` untuk memfasilitasi penghapusan transaksi berdasarkan ID yang diberikan. Provider ini mengirim request HTTP DELETE ke server 

```dart
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
    throw Exception('Terjadi kesalahan server');
  }
});
```

## View Model: Delete Transaction

`TransactionViewModel` mengextend `StateNotifier`. ViewModel ini mengatur proses penghapusan transaksi, termasuk pemanggilan provider dan pengelolaan respons. ViewModel ini bertanggung jawab untuk mengirimkan data ID yang diterima ke `deleteTransaction` dan menangani hasilnya.

```dart
class TransactionViewModel extends StateNotifier with CustomMixin {
  TransactionViewModel(super.state);

  void deleteTransaction(
    BuildContext context,
    WidgetRef ref,
    int dataTransaction,
  ) {
    ref.read(deleteTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        Get.close(2);
        debugPrint('$state');
        return ref.refresh(listDatatransactionProvider); // Berfungsi untuk update data dari server
      },
      onError: (error) {
        Get.close(1);
        showCustomPopUp(
          context: context,
          title: 'Terjadi kesalahan server',
          color: CustomColor.red,
        );
      },
    );
  }
}
```

## View: Delete Transaction

Fungsi ini bertujuan untuk menghapus transaksi berdasarkan transaksi yang dipilih oleh pengguna (mengambil ID transaksi) dan memeriksa ketersediaan koneksi internet sebelum melakukan proses.

#### Proses Pemanggilan

```dart
showLoaderOverlay(context: context); // Tampilan loading
final isOnline = await Utility.instance.checkConnection();
if (isOnline) {
    ref.read(transactionProvider.notifier).deleteTransaction(context, ref, idTransaction);
} else {
    Get.close(1);
    showCustomPopUp(
        context: context,
        time: 4,
        title: 'Anda sedang offline. Pastikan terhubung dengan internet',
        color: CustomColor.red,
    );
}
```

## Model: Data Transaction

`DataTransaction` adalah komponen model dalam arsitektur Model-View-ViewModel (MVVM) yang bertugas untuk mengelola data transaksi. Model ini menyimpan detail transaksi dan menyediakan metode untuk manipulasi data seperti parsing tanggal.

### Atribut

- `amount`: Jumlah uang dalam transaksi.
- `type`: Tipe transaksi ['income', 'expense'].
- `category`: Kategori dari transaksi (Catatan transaksi).
- `createdAt`: Tanggal dan waktu pembuatan transaksi.
- `id`: Identifikasi unik untuk transaksi.

```dart
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
    DateTime parseDate =
        DateFormat("yyyy-MM-DDTHH:mm:ss.SSSSSSZ").parse(createdAt!);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM yyyy - HH:mm', 'in');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
```

## Provider: Fetch All Transaction

Provider `listDatatransactionProvider` menggunakan `FutureProvider` untuk mengambil semua transaksi yang tersimpan di server. Provider ini mengirim request HTTP GET ke server dan memproses respons. Transaksi yang berhasil diambil dikonversi dari JSON ke objek `DataTransaction` dan dikembalikan dalam urutan terbalik (Agar yang terbaru berada diatas).

```dart
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
```

## View Model: Fetch All Transaction

`TransactionViewModel` mengextend `StateNotifier`. ViewModel ini mengatur proses pengambilan semua data transaksi dengan mengelola pemanggilan `createTransactionProvider` dan menangani hasilnya

```dart
class TransactionViewModel extends StateNotifier with CustomMixin {
  TransactionViewModel(super.state);

  void createTransaction(BuildContext context, WidgetRef ref, Map<String, dynamic> dataTransaction) {
    debugPrint('Data being sent: $dataTransaction');
    ref.read(createTransactionProvider(dataTransaction).future).then(
      (result) {
        state = 'success';
        Get.close(2);
        debugPrint('$state');
        return ref.refresh(listDatatransactionProvider);
      },
      onError: (error) {
        Get.close(1);
        showCustomPopUp(context: context, title: 'Terjadi kesalahan server', color: CustomColor.red);
      },
    );
  }
}
```

## View: Fetch All Transaction

`ListTransactionConsumer` bertanggung jawab untuk menampilkan daftar transaksi. Komponen ini mengamati dan merespons perubahan state yang berhubungan dengan data transaksi. `ListTransactionConsumer` observe ke perubahan pada data transaksi yang dikelola oleh `listDatatransactionProvider.`

#### Proses Pemanggilan

```dart
class ListTransactionConsumer extends ConsumerWidget {
  const ListTransactionConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionAsyncValue = ref.watch(listDatatransactionProvider);
    return widgetTransaction(context, ref, transactionAsyncValue);
  }
}
