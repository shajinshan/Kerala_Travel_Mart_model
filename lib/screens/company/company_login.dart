import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/data/models/company_data_model.dart';
import 'package:kerala_travel_mart/provider/login_data_provider.dart';
import 'package:kerala_travel_mart/screens/MenuScreen.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';

class CompanyLogin extends StatefulWidget {
  const CompanyLogin({super.key});

  @override
  State<CompanyLogin> createState() => _CompanyLoginState();
}

class _CompanyLoginState extends State<CompanyLogin> {
  //stores error message
  String errorMsg = "";

  //password field hide
  bool hiddenTxt = true;

  //mail controller
  final TextEditingController _mailController = TextEditingController();

  //password controller
  final TextEditingController _passwordController = TextEditingController();

  //validate mail
  void validMail(dynamic input) {
    if (input == null || input.toString().isEmpty) {
      setState(() {
        errorMsg = "Input cannot be empty";
      });
      return;
    }

    // Check if input is a number
    if (int.tryParse(input) != null) {
      // Validate number length
      if (input.length != 10) {
        setState(() {
          errorMsg = "Invalid number. It should be exactly 10 digits.";
        });
      } else {
        setState(() {
          errorMsg = "";
        });
      }
    } else {
      // Validate email format
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(input)) {
        setState(() {
          errorMsg = "Invalid email format";
        });
      } else {
        setState(() {
          errorMsg = "";
        });
      }
    }
  }

//login company
  void loginCompany() {
    if (_mailController.text.isEmpty || _passwordController.text.isEmpty) {
      showModernDialog(
          context,
          "Field cannot be Empty",
          "Please Entered mail or Phone and Password are Correct",
          "Retry",
          () {},
          PanaraDialogType.error);
      return;
    }
    String t = Provider.of<LoginDataProvider>(context, listen: false)
        .login(context, _mailController.text, _passwordController.text);

    if (t != "") {
      setState(() {
        Provider.of<CompanyDataModel>(context, listen: false).loginUpdate(true);
        Provider.of<CompanyDataModel>(context, listen: false).updateLoginId(t);
      });
      // print(Provider.of<CompanyDataModel>(context, listen: false).loginStatus);
      // print(Provider.of<CompanyDataModel>(context, listen: false).loginId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login Success"),
        ),
      );

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MenuScreen()));
    } else {
      showModernDialog(
          context,
          "Login Failed",
          "Please Check Entered mail or Phone and Password are Correct",
          "Retry",
          () {},
          PanaraDialogType.error);
    }
  }

  void showModernDialog(BuildContext context, String title, String message,
      String buttonText, Function() onTapDismiss, PanaraDialogType type) {
    PanaraInfoDialog.show(
      context,
      title: title,
      message: message,
      buttonText: buttonText,
      onTapDismiss: () {
        Navigator.pop(context);
      },
      panaraDialogType: type,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 241, 240, 240),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: GoogleFonts.gelasio(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  obscureText: false,
                  onChanged: (value) => validMail(value),
                  controller: _mailController,
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: const Color.fromARGB(255, 223, 233, 238),
                    labelText: "E-mail or Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 239, 245, 248),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 239, 245, 248),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: _passwordController,
                  // onChanged: (value) => validMail(value),
                  obscureText: hiddenTxt,

                  // controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hiddenTxt = !hiddenTxt;
                          });
                        },
                        child: hiddenTxt
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.remove_red_eye)),
                    filled: true,
                    // fillColor: const Color.fromARGB(255, 223, 233, 238),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 239, 245, 248),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 239, 245, 248),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                errorMsg,
                style: const TextStyle(color: Colors.red),
              ),

              //btn login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //login button
                  GestureDetector(
                    onTap: () => loginCompany(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 199, 55),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
