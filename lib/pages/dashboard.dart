// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_project_v4/pertemuan/pertemuan1.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan2.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan3.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan4.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan5.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan6.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan7.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan8.dart';
import 'package:flutter_project_v4/pertemuan/pertemuan9.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'Dashboard Pertemuan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView(
          children: [

            // ================= PERTEMUAN 1 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 1',
              subtitle: 'Pengenalan Android',
              icon: Icons.book,
              color: Colors.blue,
              page: const Pertemuan1Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 2 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 2',
              subtitle: 'Activity & Intent',
              icon: Icons.book,
              color: Colors.green,
              page: const Pertemuan2Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 3 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 3',
              subtitle: 'Widget & Button',
              icon: Icons.book,
              color: Colors.orange,
              page: const Pertemuan3Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 4 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 4',
              subtitle: 'Toast & AlertDialog',
              icon: Icons.book,
              color: Colors.purple,
              page: const Pertemuan4Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 5 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 5',
              subtitle: 'ListView',
              icon: Icons.book,
              color: Colors.teal,
              page: const Pertemuan5Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 6 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 6',
              subtitle: 'Checkbox & Radio',
              icon: Icons.book,
              color: Colors.indigo,
              page: const Pertemuan6Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 7 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 7',
              subtitle: 'Form RadioButton',
              icon: Icons.book,
              color: Colors.deepOrange,
              page: const Pertemuan7Page(),
            ),

            const SizedBox(height: 16),

            // ================= PERTEMUAN 8 =================
            _buildMenuCard(
              context,
              title: 'Pertemuan 8',
              subtitle: 'AutoComplete & Spinner',
              icon: Icons.book,
              color: Colors.red,
              page: const Pertemuan8Page(),
            ),

          const SizedBox(height: 16),

            // ================= PERTEMUAN 9 =================
          _buildMenuCard(
            context,
            title: 'Pertemuan 9',
            subtitle: 'Date & Time Picker',
            icon: Icons.book,
            color: Colors.cyan,
            page: const Pertemuan9Page(),
          ),
          ],
        ),
      ),
    );
  }

  // ================= MENU CARD =================
  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 5,

      shadowColor: color.withOpacity(0.3),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(18),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Row(
            children: [

              // ================= ICON =================
              Container(
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),

                  borderRadius: BorderRadius.circular(14),
                ),

                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),

              const SizedBox(width: 18),

              // ================= TEXT =================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      subtitle,

                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // ================= ARROW =================
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}