import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/data/models/company_data_model.dart';
import 'package:kerala_travel_mart/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompanyDataModel(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
