import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../screens/MenuScreen.dart';

class CustomDialog extends StatelessWidget {
  final String content;
  final IconData icons;
  void Function() onTap;
  CustomDialog(
      {super.key,
      required this.content,
      required this.icons,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 194, 193, 192),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: Lottie.network(
                    animate: true,
                    repeat: false,
                    "https://lottie.host/8baa5db4-7d8d-4fde-8a57-ff5c4cb75760/RIBr4ErFpJ.json")),
            // Icon(
            //   icons,

            //   size: 30,
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              content,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                     Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuScreen()));

                   
                  },
                  child: Text("ok")),
            )
          ],
        ),
      ),
    );
  }
}
