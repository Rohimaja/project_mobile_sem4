import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/controllers/auth/activation_step3_controller.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/constants/styles.dart';

class ActivationAccount3 extends StatelessWidget {
  ActivationAccount3({super.key});

  final activation3C = Get.put(ActivationStep3Controller());

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
                          width: 130,
                          height: 130,
                        ),
                        Image.asset(
                          "assets/images/picture_book.png",
                          width: 160,
                          height: 160,
                        ),
                        Text("Ubah Password",
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold)),
                        const SizedBox(height: 10),
                        Text("Silahkan masukkan password baru",
                            style: blackTextStyle.copyWith(fontSize: 16)),
                        const SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Password baru",
                                  style: blueTextStyle.copyWith(fontSize: 15),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 7),
                              Obx(
                                () => TextField(
                                  obscureText:
                                      !activation3C.isPasswordVisible.value,
                                  controller: activation3C.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          activation3C.checkVisible();
                                        },
                                        icon: Icon(
                                            activation3C.isPasswordVisible.value
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                    hintText:
                                        (!activation3C.isPasswordVisible.value)
                                            ? "********"
                                            : "12345678",
                                    hintStyle:
                                        greyTextStyle.copyWith(fontSize: 15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: blueColor)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text("Konfirmasi password",
                                  style: blueTextStyle.copyWith(fontSize: 15),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 7),
                              Obx(
                                () => TextField(
                                  obscureText:
                                      !activation3C.isPasswordVisible2.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    hintText:
                                        (!activation3C.isPasswordVisible2.value)
                                            ? "********"
                                            : "12345678",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          activation3C.checkVisible2();
                                        },
                                        icon: Icon(activation3C
                                                .isPasswordVisible2.value
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    hintStyle:
                                        greyTextStyle.copyWith(fontSize: 15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: blueColor)),
                                  ),
                                ),
                              ),
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
                                  label: "Submit",
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
                                    Get.back();
                                  }),
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
