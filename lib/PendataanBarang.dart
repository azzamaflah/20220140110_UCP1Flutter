import 'package:flutter/material.dart';
import 'package:ucp1/DetailTransaksi.dart'; // Import halaman DetailTransaksi

class Pendataanbarang extends StatefulWidget {
  const Pendataanbarang({super.key});

  @override
  State<Pendataanbarang> createState() => _PendataanbarangState();
}

class _PendataanbarangState extends State<Pendataanbarang> {
  // Variabel untuk menyimpan data inputan pengguna
  String selectedDate = '';
  String selectedTransactionType = 'Barang Masuk';
  String selectedItemType = 'Carrier';
  int quantity = 0;
  int unitPrice = 50000;
  int totalPrice = 0;

  // Controller untuk inputan
  TextEditingController dateController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  // Fungsi untuk menambahkan validasi pada tanggal
  String? validateDate() {
    if (selectedDate.isEmpty) {
      return 'Tanggal Transaksi tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Pendataan Barang', textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tanggal Transaksi
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Tanggal Transaksi', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                hintText: 'Tanggal Transaksi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                errorText:
                    validateDate(), // Tampilkan pesan error jika tanggal kosong
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
                    dateController.text =
                        selectedDate; // Menampilkan tanggal yang dipilih
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // Jenis Transaksi (Dropdown)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Jenis Transaksi', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedTransactionType,
              isExpanded: true,
              items:
                  <String>[
                    'Barang Masuk',
                    'Barang Keluar',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTransactionType = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Jenis Barang (Dropdown)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Jenis Barang', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedItemType,
              isExpanded: true,
              items:
                  <String>[
                    'Carrier',
                    'Sleeping Bag',
                    'Tenda',
                    'Sepatu',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItemType = newValue!;
                  // Mengubah harga satuan berdasarkan jenis barang
                  switch (selectedItemType) {
                    case 'Carrier':
                      unitPrice = 50000;
                      break;
                    case 'Sleeping Bag':
                      unitPrice = 45000;
                      break;
                    case 'Tenda':
                      unitPrice = 75000;
                      break;
                    case 'Sepatu':
                      unitPrice = 65000;
                      break;
                  }
                });
              },
            ),
            const SizedBox(height: 20),

            // Jumlah Barang and Harga Satuan (in two columns)
            Row(
              children: [
                // Jumlah Barang
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Jumlah Barang', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                // Harga Satuan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Harga Satuan', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // Jumlah Barang
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      hintText: 'Jumlah Barang',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorText:
                          quantityController.text.isEmpty
                              ? 'Jumlah barang tidak boleh kosong'
                              : null,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        quantity = int.tryParse(value) ?? 0;
                        totalPrice =
                            quantity * unitPrice; // Menghitung total harga
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                // Harga Satuan (auto fill based on item)
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: 'Rp. $unitPrice'),
                    decoration: InputDecoration(
                      hintText: 'Harga Satuan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                if (selectedDate.isNotEmpty &&
                    quantityController.text.isNotEmpty) {
                  // Navigasi ke halaman DetailTransaksi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Detailtransaksi(
                            date: selectedDate,
                            transactionType: selectedTransactionType,
                            itemType: selectedItemType,
                            quantity: quantity,
                            unitPrice: unitPrice,
                            totalPrice: totalPrice,
                          ),
                    ),
                  );
                } else {
                  // Tampilkan pesan jika ada input yang kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pastikan semua field terisi'),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
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
