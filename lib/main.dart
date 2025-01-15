import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/models/company_data_model.dart';
import 'data/models/venue_data_model.dart';
import 'provider/login_data_provider.dart';
import 'provider/theme_provider.dart';
import 'screens/LoginScreen.dart';
import 'screens/MenuScreen.dart';
import 'splashScreen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CompanyDataModel()),
        ChangeNotifierProvider(create: (_) => LoginDataProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => VenueDataModel()),
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
          theme:
              themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const InitialScreen(),
        );
      },
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Wait for 2 seconds to show the splash screen
    await Future.delayed(const Duration(seconds: 2));

    String? userId =
        await Provider.of<LoginDataProvider>(context, listen: false)
            .getUserId();

    // Navigate to the appropriate screen
    if (userId != null) {
      Provider.of<CompanyDataModel>(context, listen: false)
          .updateLoginId(userId);
      Provider.of<CompanyDataModel>(context, listen: false).loginUpdate(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
