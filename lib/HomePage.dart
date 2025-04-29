import 'package:flutter/material.dart';
import 'package:ucp1/DataPelanggan.dart';
import 'package:ucp1/Datapiket.dart';
import 'package:ucp1/LoginPage.dart'; // Pastikan Anda import halaman Datapiket

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
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/banner.jpg'),
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
            // Banner
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Image
              (image: AssetImage('assets/banner.jpg'))
            ),
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
}
