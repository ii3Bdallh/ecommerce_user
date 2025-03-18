import 'package:flutter/material.dart';

class AppBarCart extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const AppBarCart({super.key, required this.title,required this.onPressed , });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_back),
              ),
            )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer()
          ],
        ));
  }
}
