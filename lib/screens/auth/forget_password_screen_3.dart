import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stipres/controllers/auth/forget_password_step3_controller.dart';
import 'package:stipres/screens/reusable/reusable_widget.dart';
import 'package:stipres/constants/styles.dart';

class ForgetPassword3 extends StatelessWidget {
  ForgetPassword3({super.key});

  final _controller = Get.find<ForgetPasswordStep3Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ReusableBackground(),
            Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Logo_STIPRES.png",
                          width: 130,
                          height: 130,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/reset_password_1.png",
                                    width: 160,
                                    height: 160,
                                  ),
                                  Text("Ubah Password",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 20, fontWeight: bold)),
                                  const SizedBox(height: 10),
                                  Text("Silahkan masukkan password baru",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 16)),
                                  const SizedBox(height: 40),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Password baru",
                                            style: blueTextStyle.copyWith(
                                                fontSize: 15),
                                            textAlign: TextAlign.left),
                                        const SizedBox(height: 7),
                                        Obx(
                                          () => TextField(
                                            obscureText: !_controller
                                                .isPasswordVisible.value,
                                            controller:
                                                _controller.passwordController,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            onChanged: (value) {
                                              _controller.startTimerPassword();
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    _controller.checkVisible();
                                                  },
                                                  icon: Icon(_controller
                                                          .isPasswordVisible
                                                          .value
                                                      ? Icons.visibility
                                                      : Icons.visibility_off)),
                                              hintText: (!_controller
                                                      .isPasswordVisible.value)
                                                  ? "********"
                                                  : "12345678",
                                              errorText: (_controller
                                                          .valuePassword
                                                          .value ==
                                                      true)
                                                  ? _controller
                                                      .passwordErrorMessage
                                                      .value
                                                  : null,
                                              hintStyle: greyTextStyle.copyWith(
                                                  fontSize: 15),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: blueColor)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text("Konfirmasi password",
                                            style: blueTextStyle.copyWith(
                                                fontSize: 15),
                                            textAlign: TextAlign.left),
                                        const SizedBox(height: 7),
                                        Obx(
                                          () => TextField(
                                            obscureText: !_controller
                                                .isPasswordVisible2.value,
                                            controller: _controller
                                                .confirmPasswordController,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            onChanged: (value) {
                                              _controller
                                                  .startTimerConfirmPassword();
                                            },
                                            decoration: InputDecoration(
                                              hintText: (!_controller
                                                      .isPasswordVisible2.value)
                                                  ? "********"
                                                  : "12345678",
                                              errorText: (_controller
                                                          .valueConfirmPassword
                                                          .value ==
                                                      true)
                                                  ? _controller
                                                      .confirmPasswordErrorMessage
                                                      .value
                                                  : null,
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    _controller.checkVisible2();
                                                  },
                                                  icon: Icon(_controller
                                                          .isPasswordVisible2
                                                          .value
                                                      ? Icons.visibility
                                                      : Icons.visibility_off)),
                                              hintStyle: greyTextStyle.copyWith(
                                                  fontSize: 15),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: blueColor)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Obx(
                                            () => ElevatedButton(
                                              onPressed: (_controller
                                                          .isLoading.value ||
                                                      _controller
                                                          .isSnackbarOpen.value)
                                                  ? null
                                                  : () async {
                                                      await _controller
                                                          .changePassword();
                                                    },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 5,
                                                backgroundColor: blueColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                minimumSize: const Size(
                                                    double.infinity, 50),
                                              ),
                                              child: Text("Submit",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ],
                    )))
          ],
        ));
  }
}
