// ignore_for_file: unnecessary_to_list_in_spreads, deprecated_member_use

import 'package:flutter/material.dart';

class Pertemuan8Page extends StatefulWidget {
  const Pertemuan8Page({super.key});

  @override
  State<Pertemuan8Page> createState() =>
      _Pertemuan8PageState();
}

class _Pertemuan8PageState
    extends State<Pertemuan8Page> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  // ================= CONTROLLER =================
  final TextEditingController
      _universityController =
      TextEditingController();

  final TextEditingController
      _majorController =
      TextEditingController();

  // ================= SELECTED VALUE =================
  String? _selectedEducationLevel;
  String? _selectedYear;

  // ================= DATA PENDAFTAR =================
  List<Map<String, String>> dataPendaftar = [];

  // ================= DATA UNIVERSITAS =================
  final List<String> _universities = [
    'Universitas Pamulang',
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Padjadjaran',
    'Universitas Airlangga',
    'Institut Pertanian Bogor',
    'Universitas Brawijaya',
    'Universitas Diponegoro',
    'Universitas Sebelas Maret',
    'Universitas Negeri Jakarta',
    'Universitas Sumatera Utara',
  ];

  // ================= DATA JURUSAN =================
  final List<String> _majors = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Manajemen',
    'Akuntansi',
    'Hukum',
    'Kedokteran',
    'Psikologi',
    'Desain Komunikasi Visual',
    'Hubungan Internasional',
  ];

  // ================= JENJANG =================
  final List<String> _educationLevels = [
    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',
  ];

  // ================= TAHUN =================
  final List<String> _years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'Pertemuan 8',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ================= FORM =================
            Card(
              elevation: 6,

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: Padding(
                padding:
                    const EdgeInsets.all(20),

                child: Form(
                  key: _formKey,

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      const Text(
                        'Form AutoComplete & Spinner',

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ================= UNIVERSITAS =================
                      _buildAutocompleteField(
                        label: 'Universitas',

                        controller:
                            _universityController,

                        options:
                            _universities,

                        hint:
                            'Cari universitas...',

                        icon: Icons.school,
                      ),

                      const SizedBox(height: 20),

                      // ================= JURUSAN =================
                      _buildAutocompleteField(
                        label: 'Jurusan',

                        controller:
                            _majorController,

                        options: _majors,

                        hint:
                            'Cari jurusan...',

                        icon:
                            Icons.menu_book,
                      ),

                      const SizedBox(height: 20),

                      // ================= JENJANG =================
                      _buildDropdownField(
                        label:
                            'Jenjang Pendidikan',

                        value:
                            _selectedEducationLevel,

                        items:
                            _educationLevels,

                        icon: Icons
                            .school_outlined,

                        hint:
                            'Pilih jenjang pendidikan',

                        onChanged: (value) {
                          setState(() {
                            _selectedEducationLevel =
                                value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      // ================= TAHUN =================
                      _buildDropdownField(
                        label:
                            'Tahun Masuk',

                        value:
                            _selectedYear,

                        items: _years,

                        icon: Icons
                            .calendar_month,

                        hint:
                            'Pilih tahun masuk',

                        onChanged: (value) {
                          setState(() {
                            _selectedYear =
                                value;
                          });
                        },
                      ),

                      const SizedBox(height: 30),

                      // ================= BUTTON =================
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child:
                            ElevatedButton.icon(
                          onPressed:
                              _submitForm,

                          icon: const Icon(
                            Icons.save,
                          ),

                          label: const Text(
                            'Simpan Data',

                            style: TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors
                                    .deepPurple,

                            foregroundColor:
                                Colors.white,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ================= DATA PENDAFTAR =================
            const Align(
              alignment: Alignment.centerLeft,

              child: Text(
                'Data Pendaftar',

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 15),

            if (dataPendaftar.isEmpty)
              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    15,
                  ),
                ),

                child: const Center(
                  child: Text(
                    'Belum ada data pendaftar',
                  ),
                ),
              ),

            ...dataPendaftar.asMap().entries.map(
              (entry) {
                int index = entry.key;

                var data = entry.value;

                return Card(
                  elevation: 4,

                  margin:
                      const EdgeInsets.only(
                    bottom: 15,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      15,
                    ),
                  ),

                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.all(
                      15,
                    ),

                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.deepPurple,

                      child: Text(
                        '${index + 1}',

                        style:
                            const TextStyle(
                          color:
                              Colors.white,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),
                    ),

                    title: Text(
                      data['universitas'] ?? '',

                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    subtitle: Padding(
                      padding:
                          const EdgeInsets.only(
                        top: 8,
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [
                          Text(
                            'Jurusan : ${data['jurusan']}',
                          ),

                          Text(
                            'Jenjang : ${data['jenjang']}',
                          ),

                          Text(
                            'Tahun : ${data['tahun']}',
                          ),
                        ],
                      ),
                    ),

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),

                      onPressed: () {
                        setState(() {
                          dataPendaftar
                              .removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }

  // ================= AUTOCOMPLETE =================
  Widget _buildAutocompleteField({
    required String label,
    required TextEditingController
        controller,
    required List<String> options,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Autocomplete<String>(
          optionsBuilder:
              (TextEditingValue value) {
            if (value.text.isEmpty) {
              return const Iterable<String>
                  .empty();
            }

            return options.where(
              (item) => item
                  .toLowerCase()
                  .contains(
                    value.text.toLowerCase(),
                  ),
            );
          },

          onSelected: (value) {
            controller.text = value;
          },

          fieldViewBuilder: (
            context,
            textEditingController,
            focusNode,
            onFieldSubmitted,
          ) {
            return TextFormField(
              controller:
                  textEditingController,

              focusNode: focusNode,

              decoration: InputDecoration(
                hintText: hint,

                prefixIcon: Icon(icon),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
              ),

              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return '$label wajib diisi';
                }

                return null;
              },
            );
          },
        ),
      ],
    );
  }

  // ================= DROPDOWN =================
  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required String hint,
    required IconData icon,
    required Function(String?)
        onChanged,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: value,

          decoration: InputDecoration(
            prefixIcon: Icon(icon),

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                12,
              ),
            ),
          ),

          hint: Text(hint),

          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),

          onChanged: onChanged,

          validator: (value) {
            if (value == null ||
                value.isEmpty) {
              return '$label wajib dipilih';
            }

            return null;
          },
        ),
      ],
    );
  }

  // ================= SUBMIT =================
  void _submitForm() {
    if (_formKey.currentState!.validate()) {

      // TAMBAH KE LIST DATA
      setState(() {
        dataPendaftar.add({
          'universitas':
              _universityController.text,

          'jurusan':
              _majorController.text,

          'jenjang':
              _selectedEducationLevel ?? '',

          'tahun':
              _selectedYear ?? '',
        });
      });

      showDialog(
        context: context,

        builder: (context) {
          return AlertDialog(
            title: const Text('Berhasil'),

            content: Text(
              'Data berhasil disimpan.',
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _resetForm();
                },

                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // ================= RESET =================
  void _resetForm() {
    _universityController.clear();
    _majorController.clear();

    setState(() {
      _selectedEducationLevel = null;
      _selectedYear = null;
    });
  }

  // ================= DISPOSE =================
  @override
  void dispose() {
    _universityController.dispose();
    _majorController.dispose();

    super.dispose();
  }
}