import 'package:flutter/material.dart';
import 'package:stipres/screens/change_password_screen.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.blue,
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
                    color: Colors.grey.withAlpha(1),
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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                },
                child: Text("Change Password"))
          ],
        ),
      ),
    );
  }
}
