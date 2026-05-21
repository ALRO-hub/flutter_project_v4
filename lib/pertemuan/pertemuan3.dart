import 'package:flutter/material.dart';

class Pertemuan3Page extends StatefulWidget {
  const Pertemuan3Page({super.key});

  @override
  State<Pertemuan3Page> createState() => _Pertemuan3PageState();
}

class _Pertemuan3PageState extends State<Pertemuan3Page> {

  String teks = "Belum diklik";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 3"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // ================= WIDGET TEXT =================
            Text(
              teks,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ================= BUTTON =================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  teks = "Button berhasil diklik";
                });
              },

              child: const Text("Klik Saya"),
            ),
          ],
        ),
      ),
    );
  }
}