import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/styles/constant.dart';

class ActivationAccount1 extends StatelessWidget {
  const ActivationAccount1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ReusableBackground(),
            Center(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Logo_STIPRES.png",
                          width: 140,
                          height: 140,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/images/picture_book.png",
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.of(context).size.width * 0.7,
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
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ReusableButton(
                                  label: "Berikutnya",
                                  buttonStyle: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: blueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize:
                                          const Size(double.infinity, 50)),
                                  textStyle: whiteTextStyle.copyWith(
                                      fontSize: 17, fontWeight: bold),
                                  onPressed: () {
                                    Get.offNamed("/auth/activation/step2");
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Sudah validasi akun? ",
                              style: blackTextStyle.copyWith(fontSize: 14)),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: GestureDetector(
                                child: Text(
                                  "Login",
                                  style: blueTextStyle.copyWith(fontSize: 14),
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ))
                        ]))
                      ],
                    )))
          ],
        ));
  }
}
