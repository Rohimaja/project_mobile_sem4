import 'package:flutter/material.dart';
import 'package:stipres/src/auth/aktivasi_account_screen_1.dart';
import 'package:stipres/src/auth/forget_password_screen_1.dart';
import 'package:stipres/src/features_student/home/dashboard.dart';
import 'package:stipres/styles/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "assets/template_1.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Logo_STIPRES.png",
                          width: 140,
                          height: 140,
                        ),
                        Image.asset(
                          "assets/encrypted_phone_1.png",
                          width: 218,
                          height: 218,
                        ),
                        Text("Selamat Datang di STIPRES!",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold)),
                        const SizedBox(height: 7),
                        Text("Silahkan login terlebih dahulu",
                            style: blackTextStyle.copyWith(fontSize: 14)),
                        const SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Username",
                                  style: blueTextStyle.copyWith(fontSize: 12),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 250,
                                height: 35,
                                child: TextField(
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: "E41231215",
                                    hintStyle:
                                        greyTextStyle.copyWith(fontSize: 12),
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
                                  style: blueTextStyle.copyWith(fontSize: 12),
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 250,
                                height: 35,
                                child: TextField(
                                  cursorHeight: 18,
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "*******",
                                    hintStyle:
                                        greyTextStyle.copyWith(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide:
                                            BorderSide(color: blueColor)),
                                  ),
                                ),
                              ),
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
                                  child: Text(
                                    "Lupa Password?",
                                    style: linkTextStyle.copyWith(fontSize: 11),
                                    textAlign: TextAlign.right,
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
                              height: 35,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child: Text("Login",
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 14, fontWeight: bold)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
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
                                height: 35,
                                width: 175,
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
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
                                            fontSize: 14, fontWeight: bold),
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
                                    style:
                                        blackTextStyle.copyWith(fontSize: 12)),
                                WidgetSpan(
                                    child: GestureDetector(
                                  child: Text("Aktivasi",
                                      style:
                                          blueTextStyle.copyWith(fontSize: 12)),
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
