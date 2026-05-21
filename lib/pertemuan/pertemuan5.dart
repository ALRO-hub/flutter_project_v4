import 'package:flutter/material.dart';

class Pertemuan5Page extends StatelessWidget {
  const Pertemuan5Page({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mahasiswa = [
      "Andi",
      "Budi",
      "Citra",
      "Dina",
      "Eko",
      "Farhan",
      "Gina",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 5"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: mahasiswa.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),

            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  mahasiswa[index][0],
                ),
              ),

              title: Text(mahasiswa[index]),

              subtitle: Text(
                "Mahasiswa ke-${index + 1}",
              ),

              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}