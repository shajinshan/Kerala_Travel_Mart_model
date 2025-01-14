import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kerala_travel_mart/components/qr_scanner_screen.dart';
import 'package:kerala_travel_mart/provider/theme_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Logo Section
          Container(
            width: 200,
            height: 70,
            color: Colors.transparent,
            child: Row(
              children: [
                Image.asset("assets/icons/logoimage.png"),
                const SizedBox(width: 10),
                Image.asset("assets/icons/logotxt.png"),
              ],
            ),
          ),
          // Theme Toggle Button
          // Consumer<ThemeProvider>(
          //   builder: (context, themeProvider, child) {
          //     return IconButton(
          //       onPressed: themeProvider.changeTheme,
          //       icon: Icon(
          //         themeProvider.isDarkMode
          //             ? Icons.light_mode_outlined
          //             : Icons.dark_mode_outlined,
          //         size: 30,
          //         color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          //       ),
          //     );
          //   },
          // ),
          // QR Code Icon with Gradient
          GestureDetector(
            onTap: () {
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QrScannerScreen()));
            },
            //click this open camera on ondroid and ios how
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF1E3E62), Color(0xFF1E3E62)]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                size: 20,
                Icons.qr_code,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

//image

}
