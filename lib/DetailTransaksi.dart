import 'package:flutter/material.dart';

class Detailtransaksi extends StatelessWidget {
  final String date;
  final String transactionType;
  final String itemType;
  final int quantity;
  final int unitPrice;
  final int totalPrice;

  const Detailtransaksi({
    super.key,
    required this.date,
    required this.transactionType,
    required this.itemType,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Detail Transaksi', textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Icon Checkmark with Success Color
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 20),

            // Data Berhasil Disimpan Text
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tanggal', style: TextStyle(fontSize: 16)),
                Text(date, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),

            // Jenis Transaksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jenis Transaksi', style: TextStyle(fontSize: 16)),
                Text(transactionType, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),

            // Jenis Barang
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jenis Barang', style: TextStyle(fontSize: 16)),
                Text(itemType, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),

            // Jumlah Barang
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jumlah Barang', style: TextStyle(fontSize: 16)),
                Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),

            // Jenis Harga Satuan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jenis Harga Satuan',
                  style: TextStyle(fontSize: 16),
                ),
                Text('Rp. $unitPrice', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),

            // Total Harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Harga', style: TextStyle(fontSize: 16)),
                Text('Rp. $totalPrice', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),

            // Button Selesai
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text('Selesai'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 140,
                  vertical: 12,
                ),
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
