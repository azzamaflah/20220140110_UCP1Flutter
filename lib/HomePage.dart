import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Implementasikan fungsi logout di sini
            },
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/profile_icon.png'),
            ),
            const SizedBox(width: 10),
            Text('Selamat Datang'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Banner - hanya gambar tanpa teks atau tombol
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/banner.jpg', // Pastikan path gambar benar
                height: 80,
                width: double.infinity,
                fit:
                    BoxFit.cover, // Menyesuaikan ukuran gambar dengan container
              ),
            ),
            const SizedBox(height: 20),
            // Grid dengan 2 kolom di baris pertama dan 1 kolom di baris kedua
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2, // Baris pertama dengan 2 kolom
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                buildActionButton(context, 'Data Piket', Icons.chat),
                buildActionButton(context, 'Data Pelanggan', Icons.person),
              ],
            ),
            const SizedBox(height: 20),
            buildActionButton(context, 'Barang Masuk/Keluar', Icons.inventory),
          ],
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {
        // Logika navigasi untuk setiap tombol
        print('$title klik');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
