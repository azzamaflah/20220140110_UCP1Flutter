import 'package:flutter/material.dart';
import 'package:ucp1/DataPelanggan.dart';
import 'package:ucp1/Datapiket.dart';
import 'package:ucp1/LoginPage.dart';
import 'package:ucp1/PendataanBarang.dart'; // Pastikan Anda import halaman PendataanBarang

class Homepage extends StatelessWidget {
  final String email;

  const Homepage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
        title: Row(
          children: [
            // Ganti gambar profile dengan Icon
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.orange,
              ), // Icon profil
            ),
            const SizedBox(width: 10),
            Text('Selamat Datang $email'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Menghapus banner
            const SizedBox(height: 20),

            // Grid dengan 2 kolom di baris pertama dan 1 kolom di baris kedua
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                buildActionButton(context, 'Data Piket', Icons.chat),
                buildActionButton(context, 'Data Pelanggan', Icons.person),
              ],
            ),
            const SizedBox(height: 20),
            buildActionButtonFullWidth(
              context,
              'Barang Masuk/Keluar',
              Icons.inventory,
            ),
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
        if (title == 'Data Piket') {
          // Navigasi ke halaman Datapiket
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Datapiket()),
          );
        } else if (title == 'Data Pelanggan') {
          // Navigasi ke halaman Data Pelanggan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Datapelanggan()),
          );
        }
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

  // Tombol Barang Masuk/Keluar dengan lebar penuh
  Widget buildActionButtonFullWidth(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: Size(double.infinity, 50), // Full width button
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Pendataanbarang()),
        );
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
