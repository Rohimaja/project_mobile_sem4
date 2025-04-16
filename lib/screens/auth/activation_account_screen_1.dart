import 'package:flutter/material.dart';
import 'package:stipres/screens/auth/activation_account_screen_2.dart';
import 'package:stipres/styles/constant.dart';

class AktivasiAccount1 extends StatefulWidget {
  const AktivasiAccount1({super.key});

  @override
  State<AktivasiAccount1> createState() => _AktivasiAccount1State();
}

class _AktivasiAccount1State extends State<AktivasiAccount1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "assets/template_1.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).copyWith().size.width,
              height: MediaQuery.of(context).copyWith().size.height,
            ),
            Center(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Logo_STIPRES.png",
                          width: 140,
                          height: 140,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/picture_book.png",
                          width: 178,
                          height: 178,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Validasi Akun!",
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold)),
                        const SizedBox(height: 10),
                        Text("Silahkan masukkan alamat email anda",
                            style: blackTextStyle.copyWith(fontSize: 16)),
                        const SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Email",
                                style: blueTextStyle.copyWith(fontSize: 10),
                                textAlign: TextAlign.left),
                            const SizedBox(height: 7),
                            TextField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: "johndoe@gmail.com",
                                hintStyle: greyTextStyle.copyWith(fontSize: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: blueColor)),
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                      builder: (context) => AktivasiAccount2()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: Text("Berikutnya",
                                  style: whiteTextStyle.copyWith(fontSize: 15)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Sudah validasi akun? ",
                              style: blackTextStyle.copyWith(fontSize: 12)),
                          TextSpan(
                              text: "Login",
                              style: blueTextStyle.copyWith(fontSize: 12))
                        ]))
                      ],
                    )))
          ],
        ));
  }
}
