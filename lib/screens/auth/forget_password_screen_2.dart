import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stipres/screens/auth/forget_password_screen_3.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/style/constant.dart';

class ForgetPassword2 extends StatefulWidget {
  const ForgetPassword2({super.key});

  @override
  State<ForgetPassword2> createState() => _ForgetPassword2State();
}

class _ForgetPassword2State extends State<ForgetPassword2> {
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
                        Image.asset(
                          "assets/images/reset_password_1.png",
                          width: 160,
                          height: 160,
                        ),
                        Text("Perubahan Password",
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold)),
                        const SizedBox(height: 10),
                        Text(
                          "Silahkan masukkan nim dan kode OTP yang dikirim pada",
                          style: blackTextStyle.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "tok*****@gmail.com",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Kode OTP",
                                style: blueTextStyle.copyWith(fontSize: 15),
                                textAlign: TextAlign.left),
                            const SizedBox(height: 7),
                            PinCodeTextField(
                              appContext: context,
                              length: 4, // Jumlah kotak OTP
                              // controller: otpController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Hanya angka
                              ],
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                fieldHeight: 29,
                                fieldWidth: 51,
                                inactiveColor: Colors.grey,
                                activeColor: blueColor,
                                selectedColor: Colors.blueAccent,
                              ),
                              onCompleted: (value) {
                                print("Kode OTP: $value");
                              },
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: "Belum menerima kode? ",
                                style: blackTextStyle.copyWith(fontSize: 15),
                                children: [
                                  TextSpan(
                                    text: "Kirim",
                                    style: blueTextStyle.copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword3()),
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
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
