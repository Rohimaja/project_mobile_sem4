import 'package:flutter/material.dart';
import 'package:stipres/screens/features_lecturer/reusable_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ReusableButton(
              buttonStyle: ButtonStyle(),
              label: "adhawjdh",
              onPressed: () {},
            ),
            ReusableButton(
              buttonStyle: ButtonStyle(),
              label: "adhawjdh",
              onPressed: () {},
            ),
            ReusableButton(
              buttonStyle: ButtonStyle(),
              label: "adhawjdh",
              onPressed: () {},
            ),
            ReusableButton(
              buttonStyle: ButtonStyle(),
              label: "adhawjdh",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
