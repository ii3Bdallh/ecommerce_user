import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          OtpTextField(
            fieldWidth: 30,
            showCursor: true,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            numberOfFields: 6,
            borderColor: Colors.black,
            onSubmit: (code) {
              print("======================");
              print(code);
              print("======================");
            },
          )
        ],
      ),
    );
  }
}
