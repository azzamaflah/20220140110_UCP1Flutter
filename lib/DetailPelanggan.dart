import 'package:flutter/material.dart';
import 'package:ucp1/HomePage.dart';

class DetailPelanggan extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String province;
  final String postalCode;

  const DetailPelanggan({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.province,
    required this.postalCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Detail $name', textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/tokped.png',
              ), // Ganti dengan gambar profile
            ),
            const SizedBox(height: 20),

            // Name
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Email
            Text(email, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),

            // Phone
            Text(phone, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Alamat
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Alamat', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity, // Full-width container for address
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(address, style: const TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),

            // Provinsi and Kode Pos
            Row(
              children: [
                // Provinsi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Provinsi', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                // Kode Pos
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Kode Pos', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // Provinsi
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(province, style: const TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 10),
                // Kode Pos
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      postalCode,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Button "Selesai"
            ElevatedButton(
              onPressed: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(email: email),
                  ), // Arahkan ke halaman Homepage
                );
              },
              child: const Text('Selesai'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 140,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
