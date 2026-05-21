// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Pertemuan9Page extends StatelessWidget {
  const Pertemuan9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F4FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        title: const Text(
          'Date & Time Picker',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: const DateTimePickerForm(),
    );
  }
}

class DateTimePickerForm extends StatefulWidget {
  const DateTimePickerForm({super.key});

  @override
  State<DateTimePickerForm> createState() =>
      _DateTimePickerFormState();
}

class _DateTimePickerFormState
    extends State<DateTimePickerForm> {
  final _formKey = GlobalKey<FormState>();

  // ================= CONTROLLER =================

  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _dateController =
      TextEditingController();

  final TextEditingController _timeController =
      TextEditingController();

  final TextEditingController _startDateController =
      TextEditingController();

  final TextEditingController _endDateController =
      TextEditingController();

  final TextEditingController _dateTimeController =
      TextEditingController();

  // ================= DATA =================

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  DateTime? _selectedDateTime;

  // ================= DAFTAR AGENDA =================

  final List<Map<String, String>> _agendaList = [];

  // ================= DISPOSE =================

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  // ================= FORMAT =================

  static const _namaBulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} '
      '${_namaBulan[d.month - 1]} '
      '${d.year}';

  String _fmtDateShort(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} '
      '${_namaBulan[d.month - 1].substring(0, 3)} '
      '${d.year}';

  String _fmtTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:'
      '${t.minute.toString().padLeft(2, '0')}';

  // ================= DATE PICKER =================

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: _pickerTheme,
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _fmtDate(picked);
      });
    }
  }

  // ================= TIME PICKER =================

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: _pickerTheme,
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = _fmtTime(picked);
      });
    }
  }

  // ================= DATE RANGE PICKER =================

  Future<void> _pickDateRange() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange:
          (_selectedStartDate != null &&
                  _selectedEndDate != null)
              ? DateTimeRange(
                  start: _selectedStartDate!,
                  end: _selectedEndDate!,
                )
              : null,
      builder: _pickerTheme,
    );

    if (range != null) {
      setState(() {
        _selectedStartDate = range.start;
        _selectedEndDate = range.end;

        _startDateController.text =
            _fmtDateShort(range.start);

        _endDateController.text =
            _fmtDateShort(range.end);
      });
    }
  }

  // ================= DATE TIME PICKER =================

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate:
          _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: _pickerTheme,
    );

    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime:
          _selectedDateTime != null
              ? TimeOfDay.fromDateTime(
                  _selectedDateTime!,
                )
              : TimeOfDay.now(),
      builder: _pickerTheme,
    );

    if (time == null) return;

    final combined = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      _selectedDateTime = combined;

      _dateTimeController.text =
          '${_fmtDate(combined)}, ${_fmtTime(time)}';
    });
  }

  // ================= THEME =================

  Widget _pickerTheme(
    BuildContext context,
    Widget? child,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6C63FF),
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: Color(0xFF1A1A2E),
        ),
      ),
      child: child!,
    );
  }

  // ================= SIMPAN =================

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _agendaList.add({
          'judul': _titleController.text,
          'tanggal': _dateController.text,
          'waktu': _timeController.text,
          'range':
              '${_startDateController.text} - ${_endDateController.text}',
          'datetime': _dateTimeController.text,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Agenda berhasil disimpan!',
          ),
          backgroundColor: const Color(0xFF6C63FF),
          behavior: SnackBarBehavior.floating,
        ),
      );

      _resetForm();
    }
  }

  // ================= RESET =================

  void _resetForm() {
    _formKey.currentState?.reset();

    setState(() {
      _selectedDate = null;
      _selectedTime = null;
      _selectedStartDate = null;
      _selectedEndDate = null;
      _selectedDateTime = null;

      _titleController.clear();
      _dateController.clear();
      _timeController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _dateTimeController.clear();
    });
  }

  // ================= DELETE =================

  void _deleteAgenda(int index) {
    setState(() {
      _agendaList.removeAt(index);
    });
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Form(
        key: _formKey,

        child: Column(
          children: [
            // ================= INFORMASI =================

            _SectionCard(
              icon: Icons.event_note_rounded,
              title: 'Informasi Acara',

              child: _buildTextField(
                controller: _titleController,
                label: 'Judul Acara',
                hint: 'Contoh: Meeting Tim',
                icon: Icons.title,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Judul wajib diisi';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 16),

            // ================= TANGGAL =================

            _SectionCard(
              icon: Icons.calendar_today,
              title: 'Pilih Tanggal',

              child: _buildPickerField(
                controller: _dateController,
                label: 'Tanggal',
                hint: 'Pilih tanggal',
                icon: Icons.calendar_today,
                onTap: _pickDate,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Tanggal wajib dipilih';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 16),

            // ================= WAKTU =================

            _SectionCard(
              icon: Icons.access_time,
              title: 'Pilih Waktu',

              child: _buildPickerField(
                controller: _timeController,
                label: 'Waktu',
                hint: 'Pilih waktu',
                icon: Icons.access_time,
                onTap: _pickTime,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Waktu wajib dipilih';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 16),

            // ================= RANGE =================

            _SectionCard(
              icon: Icons.date_range,
              title: 'Rentang Tanggal',

              child: Column(
                children: [
                  _buildPickerField(
                    controller:
                        _startDateController,
                    label: 'Tanggal Mulai',
                    hint: 'Pilih rentang tanggal',
                    icon: Icons.play_arrow,
                    onTap: _pickDateRange,
                  ),

                  const SizedBox(height: 12),

                  _buildPickerField(
                    controller:
                        _endDateController,
                    label: 'Tanggal Selesai',
                    hint: 'Tanggal selesai',
                    icon: Icons.stop,
                    onTap: _pickDateRange,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ================= DATETIME =================

            _SectionCard(
              icon: Icons.schedule,
              title: 'Tanggal & Waktu',

              child: _buildPickerField(
                controller:
                    _dateTimeController,
                label: 'Tanggal & Waktu',
                hint: 'Pilih tanggal & waktu',
                icon: Icons.schedule,
                onTap: _pickDateTime,
              ),
            ),

            const SizedBox(height: 24),

            // ================= BUTTON =================

            FilledButton.icon(
              onPressed: _submit,

              style: FilledButton.styleFrom(
                backgroundColor:
                    const Color(0xFF6C63FF),
                minimumSize:
                    const Size(double.infinity, 52),
              ),

              icon: const Icon(Icons.save),

              label: const Text(
                'Simpan Agenda',
              ),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: _resetForm,

              style: OutlinedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 52),
              ),

              icon: const Icon(Icons.refresh),

              label: const Text(
                'Reset Form',
              ),
            ),

            const SizedBox(height: 28),

            // ================= DAFTAR AGENDA =================

            if (_agendaList.isNotEmpty)
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar Agenda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  ...List.generate(
                    _agendaList.length,
                    (index) {
                      final agenda =
                          _agendaList[index];

                      return Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 14,
                        ),

                        padding:
                            const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(
                            16,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(
                                0.05,
                              ),
                              blurRadius: 8,
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    agenda['judul']!,
                                    style:
                                        const TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    _deleteAgenda(
                                      index,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            _agendaItem(
                              Icons.calendar_today,
                              'Tanggal',
                              agenda['tanggal']!,
                            ),

                            _agendaItem(
                              Icons.access_time,
                              'Waktu',
                              agenda['waktu']!,
                            ),

                            _agendaItem(
                              Icons.date_range,
                              'Rentang',
                              agenda['range']!,
                            ),

                            _agendaItem(
                              Icons.schedule,
                              'DateTime',
                              agenda['datetime']!,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // ================= TEXT FIELD =================

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,

      decoration: _deco(
        label: label,
        hint: hint,
        icon: icon,
      ),
    );
  }

  // ================= PICKER FIELD =================

  Widget _buildPickerField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required VoidCallback onTap,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      validator: validator,

      decoration: _deco(
        label: label,
        hint: hint,
        icon: icon,
      ),
    );
  }

  // ================= DECORATION =================

  InputDecoration _deco({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,

      prefixIcon: Icon(
        icon,
        color: const Color(0xFF6C63FF),
      ),

      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFF6C63FF),
          width: 2,
        ),
      ),
    );
  }

  // ================= ITEM =================

  Widget _agendaItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),

      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF6C63FF),
          ),

          const SizedBox(width: 8),

          Text(
            '$title : ',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

// ================= SECTION CARD =================

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF6C63FF),
              ),

              const SizedBox(width: 8),

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          child,
        ],
      ),
    );
  }
}