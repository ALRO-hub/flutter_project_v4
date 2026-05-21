// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project_v4/pages/dashboard.dart';
import 'package:flutter_project_v4/pages/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _pages = [
    const DashboardPage(),
    const ProfilePage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Scaffold(
        body: _pages[currentPage],

        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,

          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },

          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Beranda'),
              selectedColor: Colors.blue,
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}