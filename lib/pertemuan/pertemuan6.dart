// ignore_for_file: depend_on_referenced_packages, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pertemuan6Page extends StatefulWidget {
  const Pertemuan6Page({super.key});

  @override
  State<Pertemuan6Page> createState() => _Pertemuan6PageState();
}

class _Pertemuan6PageState extends State<Pertemuan6Page> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nim = TextEditingController();
  final TextEditingController _kelas = TextEditingController();

  bool _setuju = false;

  final Map<String, bool> _hobi = {
    "Membaca": false,
    "Olahraga": false,
    "Musik": false,
    "Game": false,
  };

  String errNama = '';
  String errNim = '';
  String errKelas = '';
  String errHobi = '';
  String errSetuju = '';

  // ================= DATA LIST =================
  List<Map<String, dynamic>> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Dengan Checkbox"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= FORM =================
            _input(_nama, "Nama", errNama),
            const SizedBox(height: 10),

            _input(_nim, "NIM", errNim, isNumber: true),
            const SizedBox(height: 10),

            _input(_kelas, "Kelas", errKelas),

            const SizedBox(height: 20),

            // ================= HOBI =================
            const Text(
              "Pilih Hobi (min 1)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Column(
              children: _hobi.keys.map((key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _hobi[key],
                  onChanged: (val) {
                    setState(() {
                      _hobi[key] = val ?? false;
                      if (_hobi.values.any((e) => e)) errHobi = '';
                    });
                  },
                );
              }).toList(),
            ),

            if (errHobi.isNotEmpty)
              Text(errHobi, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 10),

            // ================= SETUJU =================
            CheckboxListTile(
              title: const Text("Setuju syarat & ketentuan"),
              value: _setuju,
              onChanged: (val) {
                setState(() {
                  _setuju = val ?? false;
                  if (_setuju) errSetuju = '';
                });
              },
            ),

            if (errSetuju.isNotEmpty)
              Text(errSetuju, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 20),

            // ================= BUTTON =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text("DAFTAR"),
              ),
            ),

            const SizedBox(height: 30),

            // ================= HASIL =================
            const Text(
              "Data Pendaftar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            if (dataList.isEmpty)
              const Text("Belum ada data"),

            ...dataList.asMap().entries.map((entry) {
              int index = entry.key;
              var data = entry.value;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(data['nama']),
                  subtitle: Text(
                    "NIM: ${data['nim']}\n"
                    "Kelas: ${data['kelas']}\n"
                    "Hobi: ${data['hobi']}",
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        dataList.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  // ================= INPUT =================
  Widget _input(TextEditingController c, String label, String err,
      {bool isNumber = false}) {
    return TextField(
      controller: c,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        errorText: err.isNotEmpty ? err : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // ================= SUBMIT =================
  void _submit() {
    setState(() {
      errNama = _nama.text.isEmpty ? "Nama wajib" : '';
      errNim = _nim.text.length < 8 ? "NIM minimal 8" : '';
      errKelas = _kelas.text.isEmpty ? "Kelas wajib" : '';
      errHobi = !_hobi.values.any((e) => e) ? "Pilih hobi" : '';
      errSetuju = !_setuju ? "Wajib setuju" : '';
    });

    if (errNama.isEmpty &&
        errNim.isEmpty &&
        errKelas.isEmpty &&
        errHobi.isEmpty &&
        _setuju) {

      List<String> hobiDipilih = _hobi.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

      setState(() {
        dataList.add({
          "nama": _nama.text,
          "nim": _nim.text,
          "kelas": _kelas.text,
          "hobi": hobiDipilih.join(", "),
        });
      });

      Fluttertoast.showToast(msg: "Berhasil daftar!");

      _reset();
    }
  }

  // ================= RESET =================
  void _reset() {
    _nama.clear();
    _nim.clear();
    _kelas.clear();
    _hobi.updateAll((key, value) => false);
    _setuju = false;
    setState(() {});
  }

  @override
  void dispose() {
    _nama.dispose();
    _nim.dispose();
    _kelas.dispose();
    super.dispose();
  }
}