import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingPopup extends StatefulWidget {
  const LoadingPopup({super.key});

  @override
  _LoadingPopupState createState() => _LoadingPopupState();
}

class _LoadingPopupState extends State<LoadingPopup>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timeoutTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _timeoutTimer = Timer(const Duration(seconds: 10), () {
      if (mounted && (Get.isDialogOpen ?? false)) {
        Get.back();
        Get.snackbar("Timeout", "Operasi terlalu lama, coba lagi.",
            duration: const Duration(seconds: 2));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: 60,
          height: 60,
          child: SpinKitSquareCircle(
            color: Colors.blue,
            size: 50.0,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
