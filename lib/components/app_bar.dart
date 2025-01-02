import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Standard AppBar height
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              height: 70,
              color: const Color.fromARGB(0, 255, 255, 255),
              child: Row(
                children: [
                  Image.asset("assets/icons/logoimage.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset("assets/icons/logotxt.png"),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 24, 174, 29),
                    Color.fromARGB(255, 40, 140, 29)
                  ]),
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
