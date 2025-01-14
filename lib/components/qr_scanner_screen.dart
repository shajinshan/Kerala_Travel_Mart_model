import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart' as mlkit;
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart' as mobile;
import 'package:url_launcher/url_launcher.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          mobile.MobileScanner(
            controller: mobile.MobileScannerController(
              detectionSpeed: mobile.DetectionSpeed.noDuplicates,
              returnImage: true,
            ),
            onDetect: (capture) {
              final List<mobile.Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;


              if (image != null && barcodes.isNotEmpty) {
                _showBarcodeDialog(context, image, barcodes.first.rawValue);
              }
            },
          ),
          _buildScanOverlay(context),
        ],
      ),
    );
  }

  Future<void> _openGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final mlkit.InputImage inputImage =
            mlkit.InputImage.fromFilePath(image.path);
        final mlkit.BarcodeScanner barcodeScanner =
            mlkit.GoogleMlKit.vision.barcodeScanner();

        final List<mlkit.Barcode> barcodes =
            await barcodeScanner.processImage(inputImage);

        String barcodeResults = barcodes.isNotEmpty
            ? barcodes.map((b) => b.displayValue ?? "Unknown").join(", ")
            : "No barcodes found";

        try {
          final url = Uri.parse(barcodeResults);
          await launchUrl(url);
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Barcodes: $barcodeResults')),
          );
        }

        barcodeScanner.close();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image or scan barcodes: $e')),
      );
    }
  }

  void _showBarcodeDialog(
      BuildContext context, Uint8List image, String? barcode) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(barcode ?? "No Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.memory(image),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () async {
                  if (barcode != null &&
                      Uri.tryParse(barcode)?.hasAbsolutePath == true) {
                    final url = Uri.parse(barcode);

                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No valid URL found')),
                    );
                  }
                },
                icon: const Icon(Icons.navigate_next_outlined),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScanOverlay(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              "assets/icons/qr_code_border.png",
              color: Colors.white,
            ),
          ),
          const Text(
            'Scan QR code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () => _openGallery(context),
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFE4E4E3),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_rounded, color: Colors.black, size: 20),
                  SizedBox(width: 8),
                  Text("Upload from gallery", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
