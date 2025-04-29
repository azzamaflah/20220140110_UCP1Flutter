import 'package:flutter/material.dart';
import 'package:ucp1/Detailpiket.dart';

class Datapiket extends StatefulWidget {
  const Datapiket({super.key});

  @override
  _DatapiketState createState() => _DatapiketState();
}

class _DatapiketState extends State<Datapiket> {
  // Controller untuk input nama tugas
  final TextEditingController taskController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Daftar tugas piket
  List<String> tasks = [];

  // Global key untuk form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        flexibleSpace: Center(
          child: const Text(
            'Piket Gudang',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Anggota
              const Text('Nama Anggota', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Anggota',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama anggota tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Pilih Tanggal
              const Text('Pilih Tanggal', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'Pilih Tanggal',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
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
                      dateController.text =
                          "${pickedDate.toLocal()}".split(
                            ' ',
                          )[0]; // Menampilkan tanggal yang dipilih
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text('Tugas Piket', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: taskController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Tugas Piket',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas Piket tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        setState(() {
                          // Menambahkan tugas baru ke dalam daftar
                          if (taskController.text.isNotEmpty) {
                            tasks.add(taskController.text);
                            taskController
                                .clear(); // Bersihkan input setelah ditambahkan
                          }
                        });
                      }
                    },
                    child: const Text('Tambah'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Daftar Tugas Piket - Rata Tengah
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              tasks.isEmpty
                  ? const Text('Belum ada Data')
                  : ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            244,
                            151,
                            13,
                          ), // Background sesuai dengan tombol
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(tasks[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                            onPressed: () {
                              // Implementasikan navigasi atau detail tugas
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => Detailpiket(
                                        task: tasks[index],
                                        date: dateController.text,
                                        memberName: nameController.text,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
