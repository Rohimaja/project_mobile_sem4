import 'package:get/get.dart';

class ActivationStep1Controller extends GetxController {
  final email = ''.obs;


  void checkEmail () {

    if (email.value.contains('@gmail.com')) {

      sendOtp;
    } else {
      return ;
    }
  }

  void sendOtp (){

  }
}
