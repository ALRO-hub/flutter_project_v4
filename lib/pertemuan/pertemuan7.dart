// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';

class Pertemuan7Page extends StatefulWidget {
  const Pertemuan7Page({super.key});

  @override
  State<Pertemuan7Page> createState() => _Pertemuan7PageState();
}

class _Pertemuan7PageState extends State<Pertemuan7Page> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController umur = TextEditingController();

  String? gender;
  String? job;
  String? jobType;

  List<Map<String, dynamic>> dataList = [];

  final Map<String, String> jobDesc = {
    "Admin": "Mengelola data dan administrasi",
    "Guru": "Mengajar dan mendidik",
    "Programmer": "Mengembangkan software",
    "Partnership Specialist": "Menjalin kerja sama bisnis",
    "Trader": "Melakukan jual beli aset",
  };

  Widget input(
    String hint,
    IconData icon,
    TextEditingController c,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: c,
        keyboardType:
            hint == "Umur"
                ? TextInputType.number
                : TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.green),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget genderBtn(String text, Color color) {
    bool selected = gender == text;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            gender = text;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color),
            color: selected ? color : Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget jobChip(String text, IconData icon) {
    bool selected = job == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          job = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.green : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                  color:
                      selected
                          ? Colors.white
                          : Colors.grey,
                ),

                const SizedBox(width: 5),

                Text(
                  text,
                  style: TextStyle(
                    color:
                        selected
                            ? Colors.white
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            if (selected)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  jobDesc[text] ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget jobTypeItem(
    String title,
    String subtitle,
  ) {
    bool selected = jobType == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          jobType = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                selected
                    ? Colors.green
                    : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color:
                  selected
                      ? Colors.green
                      : Colors.grey,
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    if (nama.text.isEmpty ||
        umur.text.isEmpty ||
        gender == null ||
        job == null ||
        jobType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("ISI SEMUA DATA DULU!"),
        ),
      );
      return;
    }

    final namaVal = nama.text;
    final umurVal = umur.text;
    final genderVal = gender!;
    final jobVal = job!;
    final jobTypeVal = jobType!;

    setState(() {
      dataList.add({
        "nama": namaVal,
        "umur": umurVal,
        "gender": genderVal,
        "job": jobVal,
        "jobType": jobTypeVal,
      });
    });

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text(
              "Pendaftaran Berhasil!",
            ),
            content: Text(
              "Nama: $namaVal\n"
              "Umur: $umurVal\n"
              "Gender: $genderVal\n"
              "Pekerjaan: $jobVal\n"
              "Tipe: $jobTypeVal",
            ),
          ),
    );

    reset();
  }

  void reset() {
    nama.clear();
    umur.clear();

    setState(() {
      gender = null;
      job = null;
      jobType = null;
    });
  }

  @override
  void dispose() {
    nama.dispose();
    umur.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Pertemuan 7"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            input(
              "Nama Lengkap",
              Icons.person,
              nama,
            ),

            input(
              "Umur",
              Icons.cake,
              umur,
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                genderBtn(
                  "Laki-laki",
                  Colors.blue,
                ),

                genderBtn(
                  "Perempuan",
                  Colors.pink,
                ),
              ],
            ),

            const SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  jobChip("Admin", Icons.person),
                  jobChip("Guru", Icons.school),
                  jobChip("Programmer", Icons.code),
                  jobChip(
                    "Partnership Specialist",
                    Icons.handshake,
                  ),
                  jobChip(
                    "Trader",
                    Icons.show_chart,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            jobTypeItem(
              "Full Time",
              "Bekerja 40 jam/minggu",
            ),

            jobTypeItem(
              "Part Time",
              "< 40 jam/minggu",
            ),

            jobTypeItem(
              "Freelance",
              "Pekerja lepas",
            ),

            jobTypeItem(
              "Kontrak",
              "Perjanjian waktu",
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text("Simpan Data"),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Data Pendaftar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            if (dataList.isEmpty)
              const Text("Belum ada data"),

            ...dataList.asMap().entries.map((entry) {
              int index = entry.key;
              var data = entry.value;

              return Card(
                child: ListTile(
                  title: Text(data['nama']),
                  subtitle: Text(
                    "Umur: ${data['umur']}\n"
                    "Gender: ${data['gender']}\n"
                    "Pekerjaan: ${data['job']}\n"
                    "Tipe: ${data['jobType']}",
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
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
}