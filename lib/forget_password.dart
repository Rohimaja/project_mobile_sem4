import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/foto izzul.jpg'), // Ganti dengan gambar profil
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Izzul Islam Ramadhan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Halo",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Profil"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Pengaturan"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Tentang"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Keluar"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/foto izzul.jpg'), // Ganti dengan gambar profil
            ),
            SizedBox(height: 10),
            Text(
              "Izzul Islam Ramadhan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Halo",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Email"),
                    subtitle: Text("izzulramadhan24@gmail.com"),
                  ),
                  ListTile(
                    title: Text("Nomor Telepon"),
                    subtitle: Text("081234567890"),
                  ),
                  ListTile(
                    title: Text("Alamat"),
                    subtitle: Text("Jl. Raya No. 1"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
