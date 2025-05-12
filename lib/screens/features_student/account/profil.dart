import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stipres/screens/features_student/account/change_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 25),
            _buildProfileForm(),
            _buildSettingsMenu(context),
          ],
        ),
      ),
    );
  }

  // Bagian Header dengan Foto Profil
  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none, // Agar avatar tidak terpotong
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 180, // Tambahkan tinggi agar tidak terpotong
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3C72), Color.fromARGB(255, 152, 42, 141)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: const Center(
            child: Text(
              "STIKES Panti Waluya Malang",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -40, // Pastikan avatar keluar sedikit
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/foto_izzul.jpg', // Menggunakan gambar dari assets
                    fit: BoxFit.cover,
                    width: 95,
                    height: 95,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person,
                          size: 50, color: Colors.grey);
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Bagian Form Profil
  Widget _buildProfileForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField("Full Name", "Izzul Islam Ramadhan"),
          _buildTextField("NIM", "E4123125"),
          _buildTextField("Email", "izzul123@gmail.com"),
          _buildTextField("Program Studi", "Teknik Informatika"),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "View Profile",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget TextField Readonly
  Widget _buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        controller: TextEditingController(text: value),
      ),
    );
  }

  // Bagian Menu Pengaturan
  Widget _buildSettingsMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            _buildMenuItem(context, Icons.description, "Ketentuan Layanan"),
            _buildMenuItem(context, Icons.privacy_tip, "Kebijakan Privasi"),
            _buildMenuItem(context, Icons.lock, "Ganti Password"),
          ],
        ),
      ),
    );
  }

  // Widget ListTile untuk Menu Pengaturan
  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (title == "Ganti Password") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangePassword()));
        }
      },
    );
  }
}
