import 'package:flutter/material.dart';

class Pertemuan1Page extends StatelessWidget {
  const Pertemuan1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 1"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [
            const Text(
              "Pengenalan Android",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Android adalah sistem operasi mobile yang dikembangkan oleh Google.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.task),
                title: const Text("Tugas"),
                subtitle: const Text(
                  "Jelaskan pengertian Android dan Flutter.",
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Quiz Singkat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text("Siapa pengembang Android?"),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Jawaban benar: Google"),
                  ),
                );
              },

              child: const Text("Lihat Jawaban"),
            ),
          ],
        ),
      ),
    );
  }
}