import 'package:flutter/material.dart';
import 'package:stipres/constant.dart';
import 'package:stipres/dashboard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Selamat Datang!",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold)),
                    const SizedBox(height: 10),
                    Text("Silahkan login terlebih dahulu",
                        style: blackTextStyle.copyWith(fontSize: 16)),
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
                            hintStyle: blackTextStyle.copyWith(fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: blueColor)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Lupa Password?",
                            style: linkTextStyle.copyWith(fontSize: 15),
                            textAlign: TextAlign.right),
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
                              MaterialPageRoute(builder: (context) => DashboardPage()),
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
                            text: "Belum memiliki akun? ",
                            style: blackTextStyle.copyWith(fontSize: 15),
                            children: [
                              TextSpan(
                                text: "Register",
                                style: blueTextStyle.copyWith(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}
