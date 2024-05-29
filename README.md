# Aplikasi Pencatatan Transaksi

Aplikasi mobile ini dirancang untuk membantu pengguna dalam mencatat transaksi keuangan mereka seperti pendapatan dan pengeluaran.

## Fitur Utama

- **Pencatatan Pendapatan:** Mudah menambahkan sumber-sumber pendapatan dan melacaknya secara berkala.
- **Pengelolaan Pengeluaran:** Catat setiap pengeluaran dengan rincian yang sederhana serta mudah digunakan.
- **Sinkronisasi Data:** Data disinkronisasikan di seluruh perangkat yang terinstall aplikasi ini.

## Teknologi

<img src="https://github.com/muslimindh/app-transaction/blob/main/assets/images/github/flutter.png" height="100" alt="Flutter" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/muslimindh/app-transaction/blob/main/assets/images/github/laravel.png" height="100" alt="Laravel" />

- **Mobile:** Flutter
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

Provider `createTransactionProvider` menggunakan `FutureProvider.family` untuk memungkinkan pembuatan transaksi yang dinamis berdasarkan data yang dikirimkan. Provider ini bertanggung jawab untuk mengirimkan data transaksi ke server dan mengelola respons.

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

# View: Create Transaction

Fungsi ini bertujuan untuk membuat transaksi berdasarkan data yang diberikan oleh pengguna dan memeriksa ketersediaan koneksi internet sebelum melakukan proses.

## Proses Pemanggilan

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
