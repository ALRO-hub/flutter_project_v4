import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pertemuan4Page extends StatelessWidget {
  const Pertemuan4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 4"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Ini contoh Toast",
                );
              },

              child: const Text("Tampilkan Toast"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,

                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Alert Dialog"),

                      content: const Text(
                        "Ini contoh Alert Dialog",
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },

              child: const Text("Tampilkan Alert"),
            ),
          ],
        ),
      ),
    );
  }
}