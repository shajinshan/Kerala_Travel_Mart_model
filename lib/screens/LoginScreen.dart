import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/components/modern_dialog.dart';
import 'package:kerala_travel_mart/screens/MenuScreen.dart';
import 'package:kerala_travel_mart/screens/company/company_login.dart';
import 'package:kerala_travel_mart/splashScreen/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
            ),
            Column(
              children: [
                SizedBox(
                  height: screenHeight / 6,
                  width: double.infinity,
                ),

                //logo icon
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Image.asset(
                    "assets/icons/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        // BoxShadow(
                        //   color: const Color.fromARGB(0, 255, 255, 255)
                        //       .withOpacity(0.4),
                        //   offset: const Offset(3, 4),
                        //   spreadRadius: 3,
                        //   blurRadius: 5,
                        // )
                      ],
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12)),
                  //login box
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Choose Your Login Type",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CompanyLogin()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 52, 175, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          child: const Text(
                            "Comapany Login",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SplashScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 52, 175, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          child: const Text(
                            "Seller",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 52, 175, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          child: const Text(
                            "Media",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.019,
                ),
                Container(
                  height: 120,
                  width: 200,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      // BoxShadow(
                      //     color: Colors.black.withOpacity(0.3),
                      //     offset: const Offset(2, 3),
                      //     blurRadius: 4,
                      //     spreadRadius: 2)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Powered By :",
                        style: TextStyle(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.055, // Use relative spacing
                ),

                //SKIP button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 110,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 123, 20, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.skip_next,
                              color: Colors.white,
                            ),
                            Text(
                              "Skip",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                      height: screenHeight * 0.01,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
