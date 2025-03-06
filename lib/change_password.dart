import 'package:flutter/material.dart';
import 'package:stipres/main.dart';
import 'package:stipres/styles/constant.dart';

class UbahPassword extends StatelessWidget {

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
                      "assets/Logo STIPRES.png",
                      width: 130,
                      height: 130,
                    ),
                    Image.asset(
                      "assets/reset-password 1.png",
                      width: 160,
                      height: 160,
                    ),
                    Text("Ubah Password",
                        style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold)),
                    const SizedBox(height: 10),
                    Text("Silahkan masukkan password baru",
                        style: blackTextStyle.copyWith(fontSize: 16)),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Password baru",
                            style: blueTextStyle.copyWith(fontSize: 15),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 7),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "*",
                            hintStyle: greyTextStyle.copyWith(fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: blueColor)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Konfirmasi password",
                            style: blueTextStyle.copyWith(fontSize: 15),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 7),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "*",
                            hintStyle: greyTextStyle.copyWith(fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: blueColor)),
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
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: Text("Submit",
                              style: whiteTextStyle.copyWith(fontSize: 15)),
                        ),
                      ],
                    )
                  ],
           ))));
}
}
