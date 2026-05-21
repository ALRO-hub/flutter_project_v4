// ignore_for_file: curly_braces_in_flow_control_structures, unused_import, use_build_context_synchronously, deprecated_member_use, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil
  String name = 'Alif Saputra';
  String bio =
      'I am an experienced Partnership Specialist in building and maintaining strategic relationships with various business partners across industries. My expertise includes negotiation, collaboration development, and effective communication to create shared value and long-term growth. Outside of my main job, I am also active as a Content Creator focusing on digital branding, as well as a Trader who is accustomed to market analysis and data-driven decision making. The combination of these three fields shapes my adaptive, creative, and strategic thinking. I believe that strong collaboration and targeted communication are key to creating a real impact in todays professional world.';
  String location = 'Jakarta, Indonesia';
  String email = 'alro@alro.com';
  String phone = '082113460658';
  String birthday = 'December 28, 2005';
  String occupation = 'Partnership Specialist at Qpon';
  String nim = '241011700571';
  String kelas = '04SIFE007';

  // Support both network URL and local file
  String? avatarUrl;
  File? avatarFile;

  //Data Skills
  List<String> skills = [
    'Flutter',
    'UI/UX Design',
    'Laravel',
    'Figma',
    'SQL'
  ];

  Map<String, Color> skillColors = {
    'Flutter': Colors.blue,
    'UI/UX Design': Colors.purple,
    'Laravel': Colors.deepOrangeAccent,
    'Figma': Colors.pink,
    'SQL': Colors.green,
  };

  void _updateProfile(Map<String, dynamic> updatedData) {
    setState(() {
      if (updatedData['name'] != null) name = updatedData['name'];
      if (updatedData['bio'] != null) bio = updatedData['bio'];
      if (updatedData['location'] != null)
        location = updatedData['location'];
      if (updatedData['email'] != null) email = updatedData['email'];
      if (updatedData['phone'] != null) phone = updatedData['phone'];
      if (updatedData['birthday'] != null)
        birthday = updatedData['birthday'];
      if (updatedData['occupation'] != null)
        occupation = updatedData['occupation'];
      if (updatedData['avatarUrl'] != null)
        avatarUrl = updatedData['avatarUrl'];
      if (updatedData['avatarFile'] != null)
        avatarFile = updatedData['avatarFile'];
      if (updatedData['skills'] != null) skills = updatedData['skills'];
      if (updatedData['nim'] != null) nim = updatedData['nim'];
      if (updatedData['kelas'] != null) kelas = updatedData['kelas'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Cover Header
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF667EEA),
                      Color(0xFF764BA2),
                    ],
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Image.network(
                        'https://media.licdn.com/dms/image/v2/D4D16AQGhsxrV79SV9g/profile-displaybackgroundimage-shrink_350_1400/B4DZhzNqJuHsAY-/0/1754279618471?e=1779926400&v=beta&t=YBxfiJXjeJ3C-cV_8wslGjW2raVN2QqdhA0z5JGtLzI',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Hero(
                          tag: 'avatar',
                          child: GestureDetector(
                            onTap: () => _openEditProfileSheet(),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: _getAvatarImage(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildStatCard(
                            'Posts', '0', Icons.photo_library),
                        _buildStatCard(
                            'Followers', '49.1K', Icons.people),
                        _buildStatCard(
                            'Following', '12', Icons.person_add),
                      ],
                    ),
                    const SizedBox(height: 32),

                    const Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Text(
                        bio,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFF4A5568),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    const Text(
                      'Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(Icons.email, email),
                    _buildInfoRow(Icons.phone, phone),
                    _buildInfoRow(Icons.cake, birthday),
                    _buildInfoRow(Icons.work, occupation),
                    _buildInfoRow(Icons.badge, nim),
                    _buildInfoRow(Icons.class_, kelas),
                    const SizedBox(height: 32),

                    const Text(
                      'Skills & Interests',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: skills.map((skill) {
                        return _buildSkillChip(
                          skill,
                          skillColors[skill] ?? Colors.grey,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () =>
                                _openEditProfileSheet(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF667EEA),
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Profile shared!'),
                                  behavior:
                                      SnackBarBehavior.floating,
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color(0xFF667EEA),
                              padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              side: const BorderSide(
                                color: Color(0xFF667EEA),
                                width: 2,
                              ),
                            ),
                            child: const Text(
                              'Share Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _getAvatarImage() {
    if (avatarFile != null) {
      return FileImage(avatarFile!);
    } else if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return NetworkImage(avatarUrl!);
    } else {
      return const NetworkImage(
          'https://media.licdn.com/dms/image/v2/D4D03AQGl2yiomhNHLg/profile-displayphoto-shrink_800_800/B4DZdLQQFNHkAc-/0/1749314242306?e=1779926400&v=beta&t=0PUEa0YcobsbfEsqcP61-A50zN3ekboJhZq8CEnNuGw');
    }
  }

  void _openEditProfileSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditProfileSheet(
        currentData: {
          'name': name,
          'bio': bio,
          'location': location,
          'nim': nim,
          'kelas': kelas,
          'email': email,
          'phone': phone,
          'birthday': birthday,
          'occupation': occupation,
          'avatarUrl': avatarUrl,
          'avatarFile': avatarFile,
          'skills': skills,
        },
        onSave: _updateProfile,
      ),
    );
  }

  Widget _buildStatCard(
      String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.shade50,
              Colors.grey.shade100,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon,
                color: const Color(0xFF667EEA), size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color:
                  const Color(0xFF667EEA).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF667EEA),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF4A5568),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}

// ==================== EDIT PROFILE SHEET ====================

class EditProfileSheet extends StatefulWidget {
  final Map<String, dynamic> currentData;
  final Function(Map<String, dynamic>) onSave;

  const EditProfileSheet({
    super.key,
    required this.currentData,
    required this.onSave,
  });

  @override
  State<EditProfileSheet> createState() =>
      _EditProfileSheetState();
}

class _EditProfileSheetState
    extends State<EditProfileSheet> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController locationController;
  late TextEditingController nimController;
  late TextEditingController kelasController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController birthdayController;
  late TextEditingController occupationController;
  late List<String> skills;
  late TextEditingController newSkillController;

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: widget.currentData['name']);
    bioController =
        TextEditingController(text: widget.currentData['bio']);
    locationController = TextEditingController(
        text: widget.currentData['location']);
    nimController =
        TextEditingController(text: widget.currentData['nim']);
    kelasController =
        TextEditingController(text: widget.currentData['kelas']);
    emailController =
        TextEditingController(text: widget.currentData['email']);
    phoneController =
        TextEditingController(text: widget.currentData['phone']);
    birthdayController = TextEditingController(
        text: widget.currentData['birthday']);
    occupationController = TextEditingController(
        text: widget.currentData['occupation']);
    skills =
        List<String>.from(widget.currentData['skills']);
    newSkillController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    locationController.dispose();
    nimController.dispose();
    kelasController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    occupationController.dispose();
    newSkillController.dispose();
    super.dispose();
  }

  void _addSkill() {
    if (newSkillController.text.trim().isNotEmpty) {
      setState(() {
        skills.add(newSkillController.text.trim());
        newSkillController.clear();
      });
    }
  }

  void _removeSkill(int index) {
    setState(() {
      skills.removeAt(index);
    });
  }

  void _saveChanges() {
    final updatedData = {
      'name': nameController.text,
      'bio': bioController.text,
      'location': locationController.text,
      'nim': nimController.text,
      'kelas': kelasController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'birthday': birthdayController.text,
      'occupation': occupationController.text,
      'skills': skills,
    };

    widget.onSave(updatedData);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF667EEA),
                  Color(0xFF764BA2)
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () =>
                      Navigator.pop(context),
                  icon: const Icon(Icons.close,
                      color: Colors.white),
                ),
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: _saveChanges,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Form Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                      nameController,
                      'Full Name',
                      Icons.person),
                  const SizedBox(height: 16),

                  _buildTextField(
                      locationController,
                      'Location',
                      Icons.location_on),
                  const SizedBox(height: 16),

                  _buildTextField(
                      nimController,
                      'NIM',
                      Icons.badge),
                  const SizedBox(height: 16),

                  _buildTextField(
                      kelasController,
                      'Kelas',
                      Icons.class_),
                  const SizedBox(height: 16),

                  _buildTextField(
                    emailController,
                    'Email',
                    Icons.email,
                    keyboardType:
                        TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(
                    phoneController,
                    'Phone',
                    Icons.phone,
                    keyboardType:
                        TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(
                      birthdayController,
                      'Birthday',
                      Icons.cake),
                  const SizedBox(height: 16),

                  _buildTextField(
                      occupationController,
                      'Occupation',
                      Icons.work),
                  const SizedBox(height: 16),

                  _buildTextField(
                    bioController,
                    'Bio',
                    Icons.description,
                    maxLines: 4,
                  ),

                  const SizedBox(height: 24),

                  // Skills Section
                  const Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        skills.asMap().entries.map((entry) {
                      int index = entry.key;
                      String skill = entry.value;

                      return Chip(
                        label: Text(skill),
                        backgroundColor:
                            Colors.grey.shade100,
                        deleteIcon: const Icon(
                          Icons.close,
                          size: 18,
                        ),
                        onDeleted: () =>
                            _removeSkill(index),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller:
                              newSkillController,
                          decoration: InputDecoration(
                            hintText:
                                'Add new skill',
                            border:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(12),
                            ),
                            contentPadding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          onSubmitted: (_) =>
                              _addSkill(),
                        ),
                      ),

                      const SizedBox(width: 8),

                      IconButton(
                        onPressed: _addSkill,
                        icon: const Icon(
                            Icons.add_circle),
                        color:
                            const Color(0xFF667EEA),
                        iconSize: 40,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    int maxLines = 1,
    TextInputType keyboardType =
        TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4A5568),
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF667EEA),
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF667EEA),
                width: 2,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}