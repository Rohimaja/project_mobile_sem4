import 'package:flutter/material.dart';
import 'package:stipres/src/features_student/account/profil_screen.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Selamat datang di Dashboard!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilPage()));
                },
                child: Text("Profil"))
          ],
        ),
      ),
    );
  }
}
