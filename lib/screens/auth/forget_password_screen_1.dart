import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/styles/constant.dart';

class ForgetPassword1 extends StatelessWidget {
  const ForgetPassword1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ReusableBackground(),
            Center(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Logo_STIPRES.png",
                          width: 140,
                          height: 140,
                        ),
                        Image.asset(
                          "assets/images/reset_password_1.png",
                          width: 193,
                          height: 193,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Perubahan Password",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold)),
                        const SizedBox(height: 10),
                        Text("Silahkan masukkan alamat email anda",
                            style: blackTextStyle.copyWith(fontSize: 14)),
                        const SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: blueTextStyle.copyWith(fontSize: 15),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 7),
                              TextField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: "johndoe@gmail.com",
                                  hintStyle:
                                      greyTextStyle.copyWith(fontSize: 15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(color: blueColor)),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Get.offNamed("/auth/forget-password/step2");
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child: Text("Berikutnya",
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 17)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sudah memiliki akun? ",
                                style: blackTextStyle.copyWith(fontSize: 14)),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                "Login",
                                style: linkTextStyle.copyWith(fontSize: 14),
                                textAlign: TextAlign.right,
                              ),
                            )
                          ],
                        ),
                      ],
                    )))
          ],
        ));
  }
}
