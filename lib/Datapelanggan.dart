import 'package:flutter/material.dart';
import 'package:ucp1/DetailPelanggan.dart';

class Datapelanggan extends StatefulWidget {
  const Datapelanggan({super.key});

  @override
  _DatapelangganState createState() => _DatapelangganState();
}

class _DatapelangganState extends State<Datapelanggan> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Data Pelanggan', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Form with the validation key
          child: Column(
            children: [
              // Nama Cust
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Nama Cust', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Nama Cust',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama pelanggan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email dan No Hp - Dua Kolom
              Row(
                children: [
                  // Email
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Email',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'No Hp',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Email
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  // No Hp
                  Expanded(
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'No Hp',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Hp tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Alamat - Satu Kolom
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Alamat', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Provinsi dan Kode Pos - Dua Kolom
              Row(
                children: [
                  // Provinsi
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Provinsi',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Kode Pos',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Provinsi
                  Expanded(
                    child: TextFormField(
                      controller: provinceController,
                      decoration: InputDecoration(
                        hintText: 'Provinsi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provinsi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Kode Pos
                  Expanded(
                    child: TextFormField(
                      controller: postalCodeController,
                      decoration: InputDecoration(
                        hintText: 'Kode Pos',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kode Pos tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Tombol Simpan dan Reset
              Column(
                children: [
                  // Tombol Simpan (Full Width)
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If form is valid, navigate to DetailPelanggan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DetailPelanggan(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                  province: provinceController.text,
                                  postalCode: postalCodeController.text,
                                ),
                          ),
                        );
                      }
                    },
                    child: const Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ), // Full width button
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tombol Reset (Full Width)
                  ElevatedButton(
                    onPressed: () {
                      // Reset form
                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
                      addressController.clear();
                      provinceController.clear();
                      postalCodeController.clear();
                    },
                    child: const Text('Reset'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ), // Full width button
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
