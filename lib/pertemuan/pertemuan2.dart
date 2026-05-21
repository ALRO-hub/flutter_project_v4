import 'package:flutter/material.dart';

class Pertemuan2Page extends StatelessWidget {
  const Pertemuan2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 2"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: ElevatedButton(
          child: const Text("Pindah Halaman"),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },

          child: const Text("Kembali"),
        ),
      ),
    );
  }
}