import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kerala_travel_mart/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // Handle the captured image
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image captured: ${image.path}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open camera: $e')),
      );
    }
  }

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
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                onPressed: themeProvider.changeTheme,
                icon: Icon(
                  themeProvider.isDarkMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  size: 30,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              );
            },
          ),
          // QR Code Icon with Gradient
          GestureDetector(
            onTap: () {
              _openCamera(context);
              //click this open camera on ondroid and ios how
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 24, 174, 29),
                  Color.fromARGB(255, 40, 140, 29),
                ]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
