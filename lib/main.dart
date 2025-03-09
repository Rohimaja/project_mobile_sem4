import 'package:flutter/material.dart';
import 'package:stipres/styles/constant.dart';
import 'package:stipres/screens/dashboard_screen.dart';
import 'screens/forget_password_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Logo_STIPRES.png",
                      width: 129,
                      height: 129,
                    ),
                    Image.asset(
                      "assets/encrypted_phone_1.png",
                      width: 218,
                      height: 218,
                    ),
                    Text("Selamat Datang di STIPRES!",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold)),
                    const SizedBox(height: 10),
                    Text("Silahkan login terlebih dahulu",
                        style: blackTextStyle.copyWith(fontSize: 12)),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Username",
                            style: blueTextStyle.copyWith(fontSize: 15),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 7),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "E41231215",
                            hintStyle: greyTextStyle.copyWith(fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: blueColor)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Password",
                            style: blueTextStyle.copyWith(fontSize: 15),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 7),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "*******",
                            hintStyle: greyTextStyle.copyWith(fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: blueColor)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              "Lupa Password?",
                              style: linkTextStyle.copyWith(fontSize: 15),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: Text("Login",
                              style: whiteTextStyle.copyWith(fontSize: 15)),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Belum aktivasi akun? ",
                                style: blackTextStyle.copyWith(fontSize: 15)),
                            WidgetSpan(
                                child: GestureDetector(
                              child: Text("Aktivasi",
                                  style: blueTextStyle.copyWith(fontSize: 15)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                            ))
                          ],
                        )),
                      ],
                    )
                  ],
                ))));
  }
}
