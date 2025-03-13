import 'package:flutter/material.dart';
import 'package:stipres/src/auth/forget_password_screen_2.dart';
import 'package:stipres/styles/constant.dart';

class ForgetPassword1 extends StatelessWidget {
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
                        Image.asset(
                          "assets/reset_password_1.png",
                          width: 193,
                          height: 193,
                        ),
                        Text("Perubahan Password",
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
                                      builder: (context) => ForgetPassword2()),
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
                              text: "Sudah memiliki akun? ",
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
