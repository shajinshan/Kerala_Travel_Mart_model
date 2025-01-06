import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/data/models/company_data_model.dart';
import 'package:kerala_travel_mart/provider/login_data_provider.dart';
import 'package:kerala_travel_mart/provider/theme_provider.dart';
import 'package:kerala_travel_mart/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CompanyDataModel()),
        ChangeNotifierProvider(create: (_) => LoginDataProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const LoginScreen(),
        );
      },
    );
  }
}
