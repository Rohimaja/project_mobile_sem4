import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/controllers/login_controller.dart';
import 'package:stipres/screens/auth/activation_account_screen_1.dart';
import 'package:stipres/screens/auth/forget_password_screen_1.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/styles/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ReusableBackground(),
            Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Logo_STIPRES.png",
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Selamat Datang di STIPRES!",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold)),
                        const SizedBox(height: 7),
                        Text("Silahkan login terlebih dahulu",
                            style: blackTextStyle.copyWith(fontSize: 14)),
                        const SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Username",
                                  style: blueTextStyle.copyWith(fontSize: 15),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 40,
                                child: TextField(
                                  controller: loginC.nimController,
                                  style: TextStyle(fontSize: 20),
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: "E41231215",
                                    hintStyle:
                                        greyTextStyle.copyWith(fontSize: 13),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide:
                                            BorderSide(color: blueColor)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("Password",
                                  style: blueTextStyle.copyWith(fontSize: 15),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 5),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 40,
                                  child: Obx(
                                    () => TextField(
                                      controller: loginC.passwordController,
                                      style: TextStyle(fontSize: 20),
                                      cursorHeight: 18,
                                      obscureText:
                                          !loginC.isPasswordVisible.value,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0),
                                            onPressed: () {
                                              loginC.checkVisible();
                                            },
                                            icon: Icon(
                                                loginC.isPasswordVisible.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off)),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        hintText:
                                            (!loginC.isPasswordVisible.value)
                                                ? "*******"
                                                : "1234567",
                                        hintStyle: greyTextStyle.copyWith(
                                          fontSize: 13,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide:
                                                BorderSide(color: blueColor)),
                                      ),
                                    ),
                                  )),
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPassword1()));
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(ForgetPassword1());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "Lupa Password?",
                                        style: linkTextStyle.copyWith(
                                            fontSize: 14),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
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
                                    buttonStyle: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        backgroundColor: blueColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 50)),
                                    label: "Login",
                                    textStyle: whiteTextStyle.copyWith(
                                        fontSize: 17, fontWeight: bold),
                                    onPressed: () {
                                      loginC.login();
                                    })),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 4.3,
                                  vertical: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Text("or",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        backgroundColor: blueColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 50),
                                      ),
                                      onPressed: () {},
                                      label: Text(
                                        "Login",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 17, fontWeight: bold),
                                      ),
                                      icon: Image.asset(
                                        "assets/fingerprint.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                    ))),
                            const SizedBox(height: 8),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Belum aktivasi akun? ",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                    )),
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.top,
                                    child: GestureDetector(
                                      child: Text("Aktivasi",
                                          style: blueTextStyle.copyWith(
                                            fontSize: 14,
                                          )),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AktivasiAccount1()),
                                        );
                                      },
                                    ))
                              ],
                            )),
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
