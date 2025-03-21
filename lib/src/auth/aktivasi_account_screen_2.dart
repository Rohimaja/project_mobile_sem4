import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stipres/src/auth/aktivasi_account_screen_3.dart';
import 'package:stipres/styles/constant.dart';

class AktivasiAccount2 extends StatefulWidget {
  const AktivasiAccount2({Key? key}) : super(key: key);

  @override
  State<AktivasiAccount2> createState() => _AktivasiAccount2State();
}

class _AktivasiAccount2State extends State<AktivasiAccount2> {
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
                    margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                        SizedBox(height: 10),
                        Text("Perubahan Password",
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: bold)),
                        const SizedBox(height: 10),
                        Text(
                          "Silahkan masukkan nim dan kode OTP yang dikirim pada",
                          style: blackTextStyle.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "tok*****@gmail.com",
                          style: TextStyle(fontSize: 16, color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("NIM",
                                style: blueTextStyle.copyWith(fontSize: 15),
                                textAlign: TextAlign.left),
                            const SizedBox(
                              height: 7,
                            ),
                            SizedBox(
                              width: 300,
                              height: 35,
                              child: TextField(
                                cursorHeight: 18,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: "E41231261",
                                    hintStyle:
                                        greyTextStyle.copyWith(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide:
                                            BorderSide(color: blueColor))),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
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
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 280,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AktivasiAccount3()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child: Text("Berikutnya ",
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 15)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
